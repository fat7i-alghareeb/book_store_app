import "package:book_app/Features/home/data/models/book_model.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../data/repo/user_repo_imp.dart";
import "saved_books_state.dart";

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit(this.userRepo) : super(SavedBooksInitial());
  final UserRepo userRepo;
  List<BookModel> books = [];
  void fetchSavedBooks() {
    try {
      books = userRepo.fetchSavedBooks();
      emit(SavedBooksSuccess());
    } catch (e) {
      emit(SavedBooksFailure(message: e.toString()));
    }
  }
}
