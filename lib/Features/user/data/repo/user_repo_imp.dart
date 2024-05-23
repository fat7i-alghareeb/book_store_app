import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/Core/domain/repos/user_repo.dart';
import 'package:book_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepoImp extends UserRepo {
  @override
  List<BookEntity> fetchFavoriteBooks() {
    return getBooksFromBox(Constants.kFavoriteBooksBox);
  }

  @override
  List<BookEntity> fetchSavedBooks() {
    return getBooksFromBox(Constants.kSavedBookBox);
  }

  List<BookEntity> getBooksFromBox(String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    return box.values.toList();
  }
}
