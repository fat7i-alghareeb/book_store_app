import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  List<BookModel> books = [];

  Future<void> fetchNewestBooks({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(NewestBooksLoading())
        : emit(NewestBooksPaginationLoading());
    var result = await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
    result.fold((failure) {
      pageNumber == 1
          ? emit(NewestBooksFailure(failure.message))
          : emit(NewestBooksPaginationFailure(failure.message));
    }, (books) {
      this.books = books;
      emit(NewestBooksSuccess(books));
    });
  }
}
