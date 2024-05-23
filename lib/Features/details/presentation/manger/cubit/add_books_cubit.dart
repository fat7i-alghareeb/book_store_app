import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/Core/utils/functions/save_books.dart';
import 'package:book_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_books_state.dart';

class AddBooksCubit extends Cubit<AddBooksState> {
  AddBooksCubit() : super(AddBooksInitial());
  void addToFavorite(BookEntity book) {
    try {
      saveBookData(book, Constants.kFavoriteBooksBox);
      emit(AddBooksSuccess());
    } catch (e) {
      emit(AddBooksFailure(errorMessage: e.toString()));
    }
  }

  void addToSaved(BookEntity book) {
    try {
      saveBookData(book, Constants.kSavedBookBox);
      emit(AddBooksSuccess());
    } catch (e) {
      emit(AddBooksFailure(errorMessage: e.toString()));
    }
  }
}
