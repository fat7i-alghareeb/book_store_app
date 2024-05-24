import "../../../../../../Core/domain/entities/book_entity.dart";
import "../../../../../../Core/domain/repos/user_repo.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "saved_books_state.dart";

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit(this.userRepo) : super(SavedBooksInitial());
  final UserRepo userRepo;
  List<BookEntity> books = [];
  void fetchSavedBooks() {
    try {
      books = userRepo.fetchSavedBooks();
      emit(SavedBooksSuccess());
    } catch (e) {
      emit(SavedBooksFailure(message: e.toString()));
    }
  }
}
