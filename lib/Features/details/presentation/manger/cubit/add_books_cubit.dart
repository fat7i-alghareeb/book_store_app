import '../../../../home/data/models/book_model.dart';

import '../../../../../Core/utils/functions/books_operations_with_boxes.dart';
import '../../../../../constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_books_state.dart';

class AddBooksCubit extends Cubit<AddBooksState> {
  AddBooksCubit() : super(AddBooksInitial());
  void addToFavorite(BookModel book) {
    try {
      saveBookData(book, Constants.kFavoriteBooksBox);
      emit(AddBooksSuccess());
    } catch (e) {
      emit(AddBooksFailure(errorMessage: e.toString()));
    }
  }

  void removeFromFavorite(BookModel book) {
    try {
      deleteBookData(book, Constants.kFavoriteBooksBox);
    } catch (e) {
      print(e.toString());
    }
  }

  void removeFromSaved(BookModel book) {
    try {
      deleteBookData(book, Constants.kSavedBookBox);
    } catch (e) {
      print(e.toString());
    }
  }

  void addToSaved(BookModel book) {
    try {
      saveBookData(book, Constants.kSavedBookBox);
      emit(AddBooksSuccess());
    } catch (e) {
      emit(AddBooksFailure(errorMessage: e.toString()));
    }
  }

  bool checkIfExists(BookModel book, String boxName) {
    return checkExisting(book, boxName);
  }
}
