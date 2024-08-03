import '../../../home/data/models/book_model.dart';
import '../../../../constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepo {
  List<BookModel> fetchFavoriteBooks() {
    return getBooksFromBox(Constants.kFavoriteBooksBox);
  }

  List<BookModel> fetchSavedBooks() {
    return getBooksFromBox(Constants.kSavedBookBox);
  }

  List<BookModel> getBooksFromBox(String boxName) {
    var box = Hive.box<BookModel>(boxName);
    return box.values.toList();
  }
}
