class SavedBooksState {}

final class SavedBooksInitial extends SavedBooksState {}

final class SavedBooksSuccess extends SavedBooksState {}

final class SavedBooksFailure extends SavedBooksState {
  final String message;

  SavedBooksFailure({required this.message});
}
