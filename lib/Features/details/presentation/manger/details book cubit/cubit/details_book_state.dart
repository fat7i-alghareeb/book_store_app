import 'package:book_app/Features/details/data/models/book_details_model.dart';

abstract class DetailsBookState {}

final class DetailsBookInitial extends DetailsBookState {}

final class DetailsBookLoading extends DetailsBookState {}

final class DetailsBookSuccess extends DetailsBookState {
  final BookDetailsModel bookDetailsModel;

  DetailsBookSuccess({required this.bookDetailsModel});
}

final class DetailsBookFailure extends DetailsBookState {
  final String message;

  DetailsBookFailure({required this.message});
}
