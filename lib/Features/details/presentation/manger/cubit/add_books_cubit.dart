import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/utils/functions/books_operations_with_boxes.dart';
import '../../../../../constants.dart';
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

  void removeFromFavorite(BookEntity book) {
    try {
      deleteBookData(book, Constants.kFavoriteBooksBox);
    } catch (e) {
      print(e.toString());
    }
  }

  void removeFromSaved(BookEntity book) {
    try {
      deleteBookData(book, Constants.kSavedBookBox);
    } catch (e) {
      print(e.toString());
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

  bool checkIfExists(BookEntity book, String boxName) {
    return checkExisting(book, boxName);
  }
}
