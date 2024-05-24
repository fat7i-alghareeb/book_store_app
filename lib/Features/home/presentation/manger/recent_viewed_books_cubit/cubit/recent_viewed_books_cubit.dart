import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../../Core/domain/repos/home_repo.dart';
import '../../../../../../Core/utils/functions/save_books.dart';
import '../../../../../../constants.dart';
import 'recent_viewed_books_state.dart';

class RecentViewedBooksCubit extends Cubit<RecentViewedBooksState> {
  RecentViewedBooksCubit(this.homeRepo) : super(RecentViewedBooksInitial());
  final HomeRepo homeRepo;
  List<BookEntity> _books = [];
  get books => _books;
  Future<void> addToRecentView(BookEntity book) async {
    try {
      _books = await saveBookToRecentData(book, Constants.kRecentViewedBox);
      emit(RecentViewedBooksSuccess());
    } catch (e) {
      emit(RecentViewedBooksSuccess());
    }
  }

  Future<void> fetchRecentViewedBooks() async {
    var result = await homeRepo.fetchRecentViewedBooks();
    result.fold(
      (failure) {
        emit(RecentViewedBooksFailure(errorMessage: failure.message));
      },
      (books) {
        _books = books;
        emit(RecentViewedBooksSuccess());
      },
    );
  }
}
