// import 'package:book_app/Core/shared/widgets/app_icon.dart';
// import 'package:book_app/Features/details/data/models/book_details_model.dart';
// import 'package:book_app/Features/home/data/models/book_model.dart';
// import 'package:book_app/Features/home/presentation/views/widgets/clipper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../../../Core/domain/entities/book_entity.dart';
// import '../../../../Core/shared/widgets/custom_book_image.dart';
// import '../../../../Core/utils/text_styles.dart';
// import 'widgets/book_option_widget.dart';
// import 'widgets/main_details_widget.dart';

// class DetailsScreen extends StatefulWidget {
//   const DetailsScreen({super.key, required this.book});
//   final BookModel book;

//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DetailsBody(
//         book: widget.book,
//       ),
//     );
//   }
// }

// class DetailsBody extends StatelessWidget {
//   const DetailsBody({
//     super.key,
//     required this.book,
//   });

//   final BookDetailsModel book;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           child: CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   children: [
//                     ClipPath(
//                       clipper: DetailsClipper(),
//                       child: Container(
//                         color: Colors.grey.withOpacity(0.15),
//                         height: MediaQuery.of(context).size.height * .95,
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * .12,
//                         ),
//                         Center(
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height * .35,
//                             child: Hero(
//                               tag: book.covers![0],
//                               child: CustomBookImage(image: book.description!),
//                             ),
//                           ),
//                         ),
//                         MainDetailsWidget(book: book),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Book Overview ",
//                                 style: Styles.textStyle24,
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Text(
//                                 book.description,
//                                 style: Styles.textStyle14,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 40,
//                         ),
//                         child: AppIcon(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             HapticFeedback.heavyImpact();
//                           },
//                           color: Theme.of(context).colorScheme.primary,
//                           widget: Icon(
//                             Icons.arrow_back_ios_new_rounded,
//                             color: Theme.of(context).colorScheme.secondary,
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         BookOptionWidget(
//           hight: height * .081,
//           book: book,
//         ),
//       ],
//     );
//   }
// }
