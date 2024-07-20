import 'package:book_app/Features/details/data/models/book_details.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../Features/home/data/models/search_response.dart';
import '../../../Features/home/data/models/trending_response.dart';
import '../../../Features/details/data/models/ratings_response.dart';

part 'book_services.g.dart';

@RestApi(baseUrl: "https://openlibrary.org/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('trending/daily.json')
  Future<TrendingResponse> getTrendingBooks(
      @Queries() Map<String, dynamic> map);
  @GET("{workId}/ratings.json")
  Future<RatingsResponse> getRatings(@Path("workId") String workId);
  @GET('search.json')
  Future<SearchResponse> getSearchedBooks(@Queries() Map<String, dynamic> map);
  @GET("{workId}.json")
  Future<BookDetails> getBookDetails(@Path("workId") String workId);
}
