import 'package:hive/hive.dart';
import '../../domain/entities/book_entity.dart';

void saveBooksData(List<BookEntity> books, String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.addAll(books);
}

void saveBookData(BookEntity book, String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.add(book);
}

void deleteBookData(BookEntity book, String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  int index;
  final books = box.values.toList();
  index = books.indexWhere(
    (element) => book.bookId == element.bookId,
  );
  box.deleteAt(index);
}

bool checkExisting(BookEntity book, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  final isExist = box.values.toList().indexWhere(
        (element) => book.bookId == element.bookId,
      );
  return isExist == -1 ? false : true;
}

Future<List<BookEntity>> saveBookToRecentData(
    BookEntity book, String boxName) async {
  var box = await Hive.openBox<BookEntity>(boxName);

  int existingBookIndex = -1;
  for (int i = 0; i < box.length; i++) {
    if (box.getAt(i)?.bookId == book.bookId) {
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
