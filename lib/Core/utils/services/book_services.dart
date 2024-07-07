import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../Features/home/data/models/book_model/book_model.dart';

part 'book_services.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/books/v1/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('volumes')
  Future<BookApiResponse> getBooks(@Queries() Map<String, dynamic> map);

  // @GET('volumes')
  // Future<BookApiResponse> fetchNewestBooks(@Queries() Map<String, dynamic> map);
}

@JsonSerializable()
class BookApiResponse {
  final String kind;
  final int totalItems;
  final List<BookModel> items;

  BookApiResponse({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory BookApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BookApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookApiResponseToJson(this);
}
