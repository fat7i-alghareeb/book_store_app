import 'newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/domain/repos/home_repo.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
