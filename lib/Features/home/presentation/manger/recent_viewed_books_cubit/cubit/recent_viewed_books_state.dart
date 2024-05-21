import 'package:book_app/Core/domain/entities/book_entity.dart';

abstract class RecentViewedBooksState {}

final class RecentViewedBooksInitial extends RecentViewedBooksState {}

final class RecentViewedBooksSuccess extends RecentViewedBooksState {
  RecentViewedBooksSuccess();
}

final class RecentViewedBooksFailure extends RecentViewedBooksState {
  final String errorMessage;

  RecentViewedBooksFailure({required this.errorMessage});
}
