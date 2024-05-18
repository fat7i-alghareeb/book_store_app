import 'package:flutter/material.dart';

import '../../../../../../Core/shared/widgets/shimmer.dart';
import '../../../../../../constants.dart';

class NewestBooksShimmer extends StatelessWidget {
  const NewestBooksShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: size.height * .25,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ShimmerWidget(
                      paddingLTRB: const [20, 0, 0, 0],
                      height: size.height * .21,
                      width: size.width * 0.8,
                      borderRadius: Constants.kBorderRadius,
                    ),
                    ShimmerWidget(
                      paddingLTRB: const [30, 0, 0, 10],
                      height: size.height * .23,
                      width: (size.height * .23) * 2.6 / 4,
                      borderRadius: Constants.kBorderRadius,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
