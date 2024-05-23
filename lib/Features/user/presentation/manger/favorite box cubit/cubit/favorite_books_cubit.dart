import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../../Core/domain/repos/user_repo.dart';
import 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  FavoriteBooksCubit(this.userRepo) : super(FavoriteBooksInitial());
  final UserRepo userRepo;
  List<BookEntity> books = [];
  void fetchFavoriteBooks() {
    try {
      books = userRepo.fetchFavoriteBooks();
      emit(FavoriteBooksSuccess());
    } catch (e) {
      emit(FavoriteBooksFailure(message: e.toString()));
    }
  }
}
