// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) =>
    AuthorDetails(
      bio: json['bio'] == null ? null : Bio.fromJson(json['bio']),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      birthDate: json['birth_date'] as String?,
      deathDate: json['death_date'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'photos': instance.photos,
      'name': instance.name,
      'birth_date': instance.birthDate,
      'death_date': instance.deathDate,
    };
