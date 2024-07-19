import 'package:json_annotation/json_annotation.dart';

import 'authors.dart';
import 'created.dart';
part 'book_details_model.g.dart';

@JsonSerializable()
class BookDetailsModel {
  String? title;
  String? key;
  List<Authors>? authors;
  String? description;
  List<int>? covers;
  List<String>? subjects;
  Created? created;

  BookDetailsModel({
    this.title,
    this.key,
    this.authors,
    this.description,
    this.covers,
    this.subjects,
    this.created,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsModelToJson(this);
}
