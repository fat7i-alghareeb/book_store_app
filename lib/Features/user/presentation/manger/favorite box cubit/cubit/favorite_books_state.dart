class FavoriteBooksState {}

final class FavoriteBooksInitial extends FavoriteBooksState {}

final class FavoriteBooksSuccess extends FavoriteBooksState {}

final class FavoriteBooksFailure extends FavoriteBooksState {
  final String message;

  FavoriteBooksFailure({required this.message});
}
