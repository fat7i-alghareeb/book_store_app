import 'package:book_app/Features/home/data/models/search_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/utils/services/book_services.dart';

class SearchRepo {
  final ApiService apiService;

  SearchRepo(this.apiService);
  Future<Either<Failure, SearchResponse>> fetchSearchedBooks(
      {required Map<String, dynamic> queries}) async {
    try {
      SearchResponse searchResponse =
          await apiService.getSearchedBooks(queries);
      return right(searchResponse);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDiorError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
