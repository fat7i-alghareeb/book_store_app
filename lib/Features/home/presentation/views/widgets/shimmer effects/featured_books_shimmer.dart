import 'package:flutter/material.dart';

import '../../../../../../Core/shared/widgets/shimmer.dart';
import '../../../../../../constants.dart';

class FeaturedBooksShimmer extends StatelessWidget {
  const FeaturedBooksShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget(
                borderRadius: 0,
                height: size.height * .23,
                width: ((size.height * .23) * 2.6 / 4) / 1.5,
                paddingLTRB: const [0, 0, 0, 0],
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 15, 0, 0],
                borderRadius: 0,
                height: 15,
                width: size.width * .05,
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 10, 0, 10],
                borderRadius: 0,
                height: 15,
                width: size.width * .15,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerWidget(
                borderRadius: Constants.kBorderRadius,
                height: size.height * .26,
                width: (size.height * .26) * 2.6 / 4,
                paddingLTRB: const [0, 0, 0, 00],
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 15, 0, 0],
                borderRadius: 0,
                height: 15,
                width: size.width * .25,
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 10, 0, 10],
                borderRadius: 0,
                height: 15,
                width: size.width * .35,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerWidget(
                borderRadius: 0,
                height: size.height * .23,
                width: ((size.height * .23) * 2.6 / 4) / 1.5,
                paddingLTRB: const [0, 0, 0, 0],
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 15, 0, 0],
                borderRadius: 0,
                height: 15,
                width: size.width * .05,
              ),
              ShimmerWidget(
                paddingLTRB: const [0, 10, 0, 10],
                borderRadius: 0,
                height: 15,
                width: size.width * .15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
