import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

void checkCache() async {
  var box = Hive.box<int>(Constants.kSavedTimeBox);

  if (box.values.isEmpty) {
    await box.add(DateTime.now().millisecondsSinceEpoch);
  } else {
    int savedTimestamp = box.getAt(0)!;
    var savedTime = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    var currentTime = DateTime.now();
    var difference = currentTime.difference(savedTime).inHours;
    if (difference >= 15) {
      Hive.box<BookEntity>(Constants.kFeaturedBox).clear();
      Hive.box<BookEntity>(Constants.kNewestBox).clear();
      box.putAt(0, DateTime.now().millisecondsSinceEpoch);
    }
  }
}
