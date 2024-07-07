import '../../../../Core/utils/functions/books_operations_with_boxes.dart';
import '../../../../Core/utils/services/book_services.dart';
import '../../../../Core/domain/entities/book_entity.dart';
import '../../../../constants.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

// endPoint: 'volumes?q=e&startIndex=${pageNumber * 10}'
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var response =
        await apiService.getBooks({"q": "e", "startIndex": pageNumber * 10});
    List<BookEntity> books = response.items;
    saveBooksData(books, Constants.kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var response = await apiService.getBooks({
      "q": "e",
      "orderBy": "newest",
      "langRestrict": "en",
      "startIndex": pageNumber * 10
    });
    List<BookEntity> books = response.items;
    saveBooksData(books, Constants.kNewestBox);
    return books;
  }
}
