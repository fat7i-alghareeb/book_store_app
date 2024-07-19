import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/models/book_model.dart';
import '../../../data/repos/home_repo.dart';
import 'trending_books_state.dart';

class TrendingBooksCubit extends Cubit<TrendingBooksState> {
  TrendingBooksCubit(this.homeRepo) : super(TrendingBooksInitial());
  final HomeRepo homeRepo;
  List<BookModel> books = [];
  Future<void> fetchTrendingBooks({int pageNumber = 1}) async {
    emit(TrendingBooksLoading());
    pageNumber == 1
        ? emit(TrendingBooksLoading())
        : emit(TrendingBooksPaginationLoading());

    var result = await homeRepo.fetchTrendingBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        pageNumber == 1
            ? emit(TrendingBooksFailure(failure.message))
            : emit(TrendingBooksPaginationFailure(failure.message));
      },
      (books) {
        this.books = books;
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
