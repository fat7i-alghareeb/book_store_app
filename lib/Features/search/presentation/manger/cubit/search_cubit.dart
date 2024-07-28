import 'package:book_app/Features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchBooks({required String searchText}) async {
    emit(SearchLoading());
    Map<String, dynamic> queries = {'title': searchText};
    queries.addAll(SearchConstants.sortType[SearchConstants.sortTypesIndex]!);
    queries.addAll({"limit": 10});
    var result = await searchRepo.fetchSearchedBooks(queries: queries);
    result.fold(
      (failure) {
        emit(SearchFailure(message: failure.message));
      },
      (searchResponse) {
        emit(
          SearchSuccess(searchResponse: searchResponse),
        );
      },
    );
  }
}

class SearchConstants {
  static List<String> searchTypes = [
    "Books",
    "Authors",
  ];
  static List<String> sortTypes = [
    "Recommended",
    "Newest",
    "Oldest",
  ];
  static int searchTypeIndex = 0;
  static int sortTypesIndex = 0;

  static final Map<int, Map<String, String>> sortType = {
    0: {},
    1: {"sort": "new"},
    2: {"sort": "old"},
  };
}
