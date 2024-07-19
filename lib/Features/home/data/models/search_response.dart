import 'package:json_annotation/json_annotation.dart';

import 'book_model.dart';
part "search_response.g.dart";

@JsonSerializable()
class SearchResponse {
  int? numFound;
  @JsonKey(name: 'docs')
  List<BookModel>? books;

  SearchResponse({
    this.numFound,
    this.books,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
