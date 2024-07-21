import 'package:book_app/Core/shared/models/bio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'author_details.g.dart';

@JsonSerializable()
class AuthorDetails {
  Bio? bio;

  List<int>? photos;

  String? name;
  @JsonKey(name: "birth_date")
  String? birthDate;
  @JsonKey(name: "death_date")
  String? deathDate;

  AuthorDetails(
      {this.bio, this.photos, this.birthDate, this.deathDate, this.name});
  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
