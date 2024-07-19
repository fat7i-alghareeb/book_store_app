import 'package:json_annotation/json_annotation.dart';
part 'authors.g.dart';

@JsonSerializable()
class Authors {
  Author? author;

  Authors({this.author});

  factory Authors.fromJson(Map<String, dynamic> json) =>
      _$AuthorsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorsToJson(this);
}

@JsonSerializable()
class Author {
  String? key;

  Author({this.key});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
