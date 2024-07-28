import 'package:flutter/material.dart';

import '../../../../../Core/shared/widgets/book_card.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../../../home/data/models/search_response.dart';

class SearchSuccessWidget extends StatelessWidget {
  const SearchSuccessWidget({
    super.key,
    required this.searchResponse,
  });
  final SearchResponse searchResponse;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: (searchResponse.books!.length + 1),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${searchResponse.numFound} Results Found",
                style: Styles.textStyle14,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }
        return BookCard(
          height: MediaQuery.of(context).size.height * .24,
          book: searchResponse.books![index - 1],
          containerWidth: MediaQuery.of(context).size.width - 40,
        );
      },
    );
  }
}
