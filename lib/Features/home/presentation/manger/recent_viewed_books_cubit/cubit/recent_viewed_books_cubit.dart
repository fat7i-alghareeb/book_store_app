import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/functions/books_operations_with_boxes.dart';
import '../../../../../../constants.dart';
import '../../../../data/repos/home_repo.dart';
import 'recent_viewed_books_state.dart';

class RecentViewedBooksCubit extends Cubit<RecentViewedBooksState> {
  RecentViewedBooksCubit(this.homeRepo) : super(RecentViewedBooksInitial());
  final HomeRepo homeRepo;
  List<BookModel> _books = [];
  get books => _books;
  Future<void> addToRecentView(BookModel book) async {
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
