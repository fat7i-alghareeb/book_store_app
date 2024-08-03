import '../../../data/models/book_model.dart';

abstract class TrendingBooksState {}

class TrendingBooksInitial extends TrendingBooksState {}

class TrendingBooksLoading extends TrendingBooksState {}

class TrendingBooksPaginationLoading extends TrendingBooksState {}

class TrendingBooksPaginationFailure extends TrendingBooksState {
  final String errMessage;

  TrendingBooksPaginationFailure(this.errMessage);
}

class TrendingBooksFailure extends TrendingBooksState {
  final String errMessage;

  TrendingBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends TrendingBooksState {
  final List<BookModel> books;

  FeaturedBooksSuccess(this.books);
}
