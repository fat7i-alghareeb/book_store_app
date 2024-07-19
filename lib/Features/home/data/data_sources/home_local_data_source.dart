import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:hive/hive.dart';
import '../../../../constants.dart';

class HomeLocalDataSource {
  List<BookModel> fetchTrendingBooks({int pageNumber = 1}) {
    int startIndex = (pageNumber - 1) * 10;
    int endIndex = (pageNumber) * 10;

    var box = Hive.box<BookModel>(Constants.kTrendingBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  List<BookModel> fetchNewestBooks({int pageNumber = 1}) {
    int startIndex = (pageNumber - 1) * 10;
    int endIndex = (pageNumber) * 10;

    var box = Hive.box<BookModel>(Constants.kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  List<BookModel> fetchRecentViewedBooks() {
    var box = Hive.box<BookModel>(Constants.kRecentViewedBox);
    return box.values.toList();
  }
}
