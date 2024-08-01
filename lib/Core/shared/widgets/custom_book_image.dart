import 'package:book_app/Core/utils/helper_extensions.dart';

import '../../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          child: CachedNetworkImage(
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: context.accentColor(),
              ),
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
