import '../models/book_model/book_model.dart';

import '../../../../Core/utils/functions/save_books.dart';
import '../../../../Core/utils/services/book_services.dart';
import '../../../../Core/domain/entities/book_entity.dart';
import '../../../../constants.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?q=e&startIndex=${pageNumber * 10}');
    List<BookEntity> books =
        data.map((book) => BookModel.fromJson(book)).toList();
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=a&langRestrict=en&orderBy=newest&startIndex=${pageNumber * 10}');
    List<BookEntity> books =
        data.map((book) => BookModel.fromJson(book)).toList();
    saveBooksData(books, kNewestBox);
    return books;
  }
}
//   List<BookEntity> getBooksList(Map<String, dynamic> data) {
//     List<BookEntity> books = [];
//     for (var bookMap in data['items']) {
//       books.add(BookModel.fromJson(bookMap));
//     }
//     return books;
//   }
// }
