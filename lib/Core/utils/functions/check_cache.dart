import 'package:book_app/Features/home/data/models/book_model.dart';
import '../../../constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> checkCache({bool clearNow = false}) async {
  var box = Hive.box<int>(Constants.kSavedTimeBox);

  if (box.values.isEmpty) {
    await box.add(DateTime.now().millisecondsSinceEpoch);
  } else {
    int savedTimestamp = box.getAt(0)!;
    var savedTime = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    var currentTime = DateTime.now();
    var difference = currentTime.difference(savedTime).inHours;

    if (difference >= 24 || clearNow) {
      await Hive.box<BookModel>(Constants.kTrendingBox).clear();
      await Hive.box<BookModel>(Constants.kNewestBox).clear();
      box.putAt(0, DateTime.now().millisecondsSinceEpoch);
    }
  }
}
