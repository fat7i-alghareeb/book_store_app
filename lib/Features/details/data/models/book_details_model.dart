import 'package:book_app/Features/details/data/models/book_details.dart';
import 'package:book_app/Features/details/data/models/ratings_response.dart';

class BookDetailsModel {
  final BookDetails bookDetails;
  final Rating rating;
  BookDetailsModel({required this.bookDetails, required this.rating});
}
