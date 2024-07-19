import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repo/user_repo_imp.dart';
import 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  FavoriteBooksCubit(this.userRepo) : super(FavoriteBooksInitial());
  final UserRepo userRepo;
  List<BookModel> books = [];
  void fetchFavoriteBooks() {
    try {
      books = userRepo.fetchFavoriteBooks();
      emit(FavoriteBooksSuccess());
    } catch (e) {
      emit(FavoriteBooksFailure(message: e.toString()));
    }
  }
}
