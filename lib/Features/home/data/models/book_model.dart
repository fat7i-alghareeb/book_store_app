import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class BookModel {
  @HiveField(0)
  @JsonKey(name: 'author_name')
  List<String>? authorName;
  @HiveField(1)
  @JsonKey(name: 'cover_edition_key')
  String? coverEditionKey;
  @HiveField(2)
  String? title;
  @HiveField(3)
  @JsonKey(name: 'ratings_average')
  double? ratingsAverage;
  @HiveField(4)
  @JsonKey(name: 'cover_i')
  int? coverId;
  @HiveField(5)
  String? key;
  @JsonKey(name: "author_key")
  @HiveField(6)
  List<String>? authorKey;
  BookModel({
    this.authorName,
    this.coverEditionKey,
    this.title,
    this.ratingsAverage,
    this.key,
    this.coverId,
    this.authorKey,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
