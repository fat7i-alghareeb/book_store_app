// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authors _$AuthorsFromJson(Map<String, dynamic> json) => Authors(
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorsToJson(Authors instance) => <String, dynamic>{
      'author': instance.author,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      key: json['key'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'key': instance.key,
    };
