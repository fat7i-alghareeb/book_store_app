import 'package:book_app/Features/details/data/repo/details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_book_state.dart';

class DetailsBookCubit extends Cubit<DetailsBookState> {
  DetailsBookCubit(this.detailsRepo) : super(DetailsBookInitial());
  final DetailsRepo detailsRepo;
  Future<void> fetchBookDetails({
    required String bookPath,
    required String authorId,
  }) async {
    emit(DetailsBookLoading());

    var result = await detailsRepo.fetchBookDetails(
        bookPath: bookPath, authorId: authorId);
    result.fold(
      (failure) {
        emit(DetailsBookFailure(message: failure.message));
      },
      (bookDetailsModel) {
        emit(
          DetailsBookSuccess(bookDetailsModel: bookDetailsModel),
        );
      },
    );
  }
}
