// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 0;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      authorName: (fields[0] as List?)?.cast<String>(),
      coverEditionKey: fields[1] as String?,
      title: fields[2] as String?,
      ratingsAverage: fields[3] as double?,
      key: fields[5] as String?,
      coverId: fields[4] as int?,
      authorKey: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.authorName)
      ..writeByte(1)
      ..write(obj.coverEditionKey)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.ratingsAverage)
      ..writeByte(4)
      ..write(obj.coverId)
      ..writeByte(5)
      ..write(obj.key)
      ..writeByte(6)
      ..write(obj.authorKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      authorName: (json['author_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coverEditionKey: json['cover_edition_key'] as String?,
      title: json['title'] as String?,
      ratingsAverage: (json['ratings_average'] as num?)?.toDouble(),
      key: json['key'] as String?,
      coverId: (json['cover_i'] as num?)?.toInt(),
      authorKey: (json['author_key'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'author_name': instance.authorName,
      'cover_edition_key': instance.coverEditionKey,
      'title': instance.title,
      'ratings_average': instance.ratingsAverage,
      'cover_i': instance.coverId,
      'key': instance.key,
      'author_key': instance.authorKey,
    };
