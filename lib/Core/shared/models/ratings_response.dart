import 'package:json_annotation/json_annotation.dart';
part 'ratings_response.g.dart';

@JsonSerializable()
class RatingsResponse {
  @JsonKey(name: "summary")
  final Rating? rating;
  RatingsResponse({this.rating});

  factory RatingsResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsResponseToJson(this);
}

@JsonSerializable()
class Rating {
  final int? average;
  final int? count;

  Rating({this.average, this.count});
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
