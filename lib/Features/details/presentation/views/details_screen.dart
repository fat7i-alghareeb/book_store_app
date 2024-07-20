import 'package:book_app/Core/shared/widgets/app_icon.dart';
import 'package:book_app/Core/utils/functions/get_image.dart';
import 'package:book_app/Features/details/data/models/book_details_model.dart';
import 'package:book_app/Features/details/presentation/manger/details%20book%20cubit/cubit/details_book_cubit.dart';
import 'package:book_app/Features/details/presentation/manger/details%20book%20cubit/cubit/details_book_state.dart';
import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:book_app/Features/home/presentation/views/widgets/clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/shared/widgets/custom_book_image.dart';
import '../../../../Core/utils/text_styles.dart';
import 'widgets/book_option_widget.dart';
import 'widgets/main_details_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.book});
  final BookModel book;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsBookCubit>(context)
        .fetchBookDetails(bookPath: widget.book.key!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsBookCubit, DetailsBookState>(
        builder: (context, state) {
          if (state is DetailsBookSuccess) {
            return DetailsBody(
              book: widget.book,
              bookDetailsModel: state.bookDetailsModel,
            );
          } else if (state is DetailsBookFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
        },
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.book,
    required this.bookDetailsModel,
  });

  final BookDetailsModel bookDetailsModel;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: DetailsClipper(),
                      child: Container(
                        color: Colors.grey.withOpacity(0.15),
                        height: MediaQuery.of(context).size.height * .95,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .35,
                            child: Hero(
                              tag: book.key!,
                              child: CustomBookImage(
                                image: getImage(
                                  olid: book.coverEditionKey,
                                  id: book.coverId,
                                ),
                              ),
                            ),
                          ),
                        ),
                        MainDetailsWidget(bookDetailsModel: bookDetailsModel),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Book Overview ",
                                style: Styles.textStyle24,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                bookDetailsModel
                                        .bookDetails.description?.value ??
                                    " ",
                                style: Styles.textStyle14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 40,
                        ),
                        child: AppIcon(
                          onPressed: () {
                            Navigator.pop(context);
                            HapticFeedback.heavyImpact();
                          },
                          color: Theme.of(context).colorScheme.primary,
                          widget: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BookOptionWidget(
          hight: height * .081,
          book: book,
        ),
      ],
    );
  }
}
