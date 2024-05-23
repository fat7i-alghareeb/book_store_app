import '../entities/book_entity.dart';

abstract class UserRepo {
  List<BookEntity> fetchSavedBooks();
  List<BookEntity> fetchFavoriteBooks();
}
