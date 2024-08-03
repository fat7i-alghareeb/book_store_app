import '../../../Features/home/data/models/book_model.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookModel> books, String boxName) async {
  var box = Hive.box<BookModel>(boxName);
  await box.addAll(books);
}

void saveBookData(BookModel book, String boxName) async {
  var box = Hive.box<BookModel>(boxName);
  await box.add(book);
}

void deleteBookData(BookModel book, String boxName) async {
  var box = Hive.box<BookModel>(boxName);
  int index;
  final books = box.values.toList();
  index = books.indexWhere(
    (element) => book.coverEditionKey == element.coverEditionKey,
  );
  box.deleteAt(index);
}

bool checkExisting(BookModel book, String boxName) {
  var box = Hive.box<BookModel>(boxName);
  final isExist = box.values.toList().indexWhere(
        (element) => book.coverEditionKey == element.coverEditionKey,
      );
  return isExist == -1 ? false : true;
}

Future<List<BookModel>> saveBookToRecentData(
    BookModel book, String boxName) async {
  var box = await Hive.openBox<BookModel>(boxName);

  int existingBookIndex = -1;
  for (int i = 0; i < box.length; i++) {
    if (box.getAt(i)?.coverEditionKey == book.coverEditionKey) {
      existingBookIndex = i;
      break;
    }
  }

  if (existingBookIndex != -1) {
    box.deleteAt(existingBookIndex);
  }

  if (box.length >= 15) {
    box.deleteAt(0);
  }
  box.add(book);
  return box.values.toList();
}
