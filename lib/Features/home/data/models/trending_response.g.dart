// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponse _$TrendingResponseFromJson(Map<String, dynamic> json) =>
    TrendingResponse(
      books: (json['works'] as List<dynamic>?)
          ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingResponseToJson(TrendingResponse instance) =>
    <String, dynamic>{
      'works': instance.books,
    };
