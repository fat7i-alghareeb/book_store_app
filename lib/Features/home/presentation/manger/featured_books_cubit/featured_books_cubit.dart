import 'package:bloc/bloc.dart';

import '../../../../../Core/domain/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    // if (pageNumber == 0) {
    //   emit(FeaturedBooksLoading());
    // } else {
    //   emit(FeaturedBooksPaginationLoading());
    // }
    var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.message));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
