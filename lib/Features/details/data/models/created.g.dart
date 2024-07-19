// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Created _$CreatedFromJson(Map<String, dynamic> json) => Created(
      value: json['value'] == null
          ? null
          : DateTime.parse(json['value'] as String),
    );

Map<String, dynamic> _$CreatedToJson(Created instance) => <String, dynamic>{
      'value': instance.value?.toIso8601String(),
    };
