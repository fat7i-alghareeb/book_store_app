import 'package:book_app/Features/home/data/models/book_model.dart';
import '../../../../Core/utils/functions/books_operations_with_boxes.dart';
import '../../../../Core/utils/services/book_services.dart';
import '../../../../constants.dart';

class HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource(this.apiService);

  Future<List<BookModel>> fetchTrendingBooks({int pageNumber = 1}) async {
    var response = await apiService.getTrendingBooks({
      "page": pageNumber,
      "limit": 10,
    });
    List<BookModel> books = response.books!;
    saveBooksData(books, Constants.kTrendingBox);
    return books;
  }

  Future<List<BookModel>> fetchNewestBooks({int pageNumber = 1}) async {
    var response = await apiService.getSearchedBooks({
      "q": "programming",
      "page": pageNumber,
      "limit": 10,
    });
    List<BookModel> books = response.books!;
    saveBooksData(books, Constants.kNewestBox);
    return books;
  }
}
