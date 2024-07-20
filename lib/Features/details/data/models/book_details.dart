import 'package:json_annotation/json_annotation.dart';

import 'authors.dart';
import 'created.dart';
import 'description.dart';
part 'book_details.g.dart';

@JsonSerializable()
class BookDetails {
  String? title;
  String? key;
  List<Authors>? authors;
  Description? description;
  List<int>? covers;
  List<String>? subjects;
  Created? created;

  BookDetails({
    this.title,
    this.key,
    this.authors,
    this.description,
    this.covers,
    this.subjects,
    this.created,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsToJson(this);
}
