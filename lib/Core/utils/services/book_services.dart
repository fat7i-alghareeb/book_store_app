import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../Features/home/data/models/search_response.dart';
import '../../../Features/home/data/models/trending_response.dart';
import '../../shared/models/ratings_response.dart';

part 'book_services.g.dart';

@RestApi(baseUrl: "https://openlibrary.org/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('trending/daily.json')
  Future<TrendingResponse> getTrendingBooks(
      @Queries() Map<String, dynamic> map);
  @GET("works/{workId}/ratings.json")
  Future<RatingsResponse> getRatings(@Path("workId") String workId);
  @GET('search.json')
  Future<SearchResponse> getSearchedBooks(@Queries() Map<String, dynamic> map);
}
