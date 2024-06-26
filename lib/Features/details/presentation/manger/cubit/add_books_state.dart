abstract class AddBooksState {}

final class AddBooksInitial extends AddBooksState {}

final class AddBooksSuccess extends AddBooksState {}

final class AddBooksFailure extends AddBooksState {
  final String errorMessage;

  AddBooksFailure({required this.errorMessage});
}
