import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends BookEntity {
  String? kind;
  final String id;
  String? etag;
  String? selfLink;
  final VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    required this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          bookId: id,
          description: volumeInfo.description ?? "",
          image: volumeInfo.imageLinks?.thumbnail ??
              'https://dynamic.brandcrowd.com/template/preview/design/7469eb20-04f4-46fa-82a9-9d17dca76a4c?v=4&designTemplateVersion=1&size=design-preview-standalone-1x',
          authorName: volumeInfo.authors?.first ?? 'No Name',
          price: 0.0,
          rating: volumeInfo.averageRating ?? 0,
          title: volumeInfo.title!,
          author: volumeInfo.authors?[0] ?? " ",
        );
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
