import 'package:json_annotation/json_annotation.dart';

import 'book_model.dart';
part "trending_response.g.dart";

@JsonSerializable()
class TrendingResponse {
  @JsonKey(name: 'works')
  List<BookModel>? books;

  TrendingResponse({
    this.books,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingResponseToJson(this);
}
