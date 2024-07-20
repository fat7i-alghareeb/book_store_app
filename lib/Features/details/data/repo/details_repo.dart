import 'package:book_app/Features/details/data/models/book_details.dart';
import 'package:book_app/Features/details/data/models/book_details_model.dart';
import 'package:book_app/Features/details/data/models/ratings_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/utils/services/book_services.dart';

class DetailsRepo {
  final ApiService apiService;

  DetailsRepo(this.apiService);
  Future<Either<Failure, BookDetailsModel>> fetchBookDetails(
      {required String bookPath}) async {
    BookDetails bookDetails;
    BookDetailsModel bookDetailsModel;
    try {
      bookDetails = await apiService.getBookDetails(bookPath);
      RatingsResponse ratingsResponse = await apiService.getRatings(bookPath);
      bookDetailsModel = BookDetailsModel(
          bookDetails: bookDetails, rating: ratingsResponse.rating!);
      return right(bookDetailsModel);
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
