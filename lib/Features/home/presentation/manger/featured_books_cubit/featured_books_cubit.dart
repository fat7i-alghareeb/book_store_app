import 'package:bloc/bloc.dart';
import 'package:book_app/Core/domain/entities/book_entity.dart';

import '../../../../../Core/domain/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  List<BookEntity> books = [];
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    pageNumber == 0
        ? emit(FeaturedBooksLoading())
        : emit(FeaturedBooksPaginationLoading());

    var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        pageNumber == 0
            ? emit(FeaturedBooksFailure(failure.message))
            : emit(FeaturedBooksPaginationFailure(failure.message));
      },
      (books) {
        this.books = books;
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
