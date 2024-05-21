import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_books_state.dart';

class AddBooksCubit extends Cubit<AddBooksState> {
  AddBooksCubit() : super(AddBooksInitial());
}
