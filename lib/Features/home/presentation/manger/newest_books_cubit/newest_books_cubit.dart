import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/domain/repos/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  List<BookEntity> books = [];

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    pageNumber == 0
        ? emit(NewestBooksLoading())
        : emit(NewestBooksPaginationLoading());
    var result = await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
    result.fold((failure) {
      pageNumber == 0
          ? emit(NewestBooksFailure(failure.message))
          : emit(NewestBooksPaginationFailure(failure.message));
    }, (books) {
      this.books = books;
      emit(NewestBooksSuccess(books));
    });
  }
}
