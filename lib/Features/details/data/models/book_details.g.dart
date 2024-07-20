// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) => BookDetails(
      title: json['title'] as String?,
      key: json['key'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Authors.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description']),
      covers: (json['covers'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      created: json['created'] == null
          ? null
          : Created.fromJson(json['created'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookDetailsToJson(BookDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'authors': instance.authors,
      'description': instance.description,
      'covers': instance.covers,
      'subjects': instance.subjects,
      'created': instance.created,
    };
