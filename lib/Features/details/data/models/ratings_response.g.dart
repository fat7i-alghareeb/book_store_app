// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingsResponse _$RatingsResponseFromJson(Map<String, dynamic> json) =>
    RatingsResponse(
      rating: json['summary'] == null
          ? null
          : Rating.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingsResponseToJson(RatingsResponse instance) =>
    <String, dynamic>{
      'summary': instance.rating,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      average: (json['average'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'average': instance.average,
      'count': instance.count,
    };
