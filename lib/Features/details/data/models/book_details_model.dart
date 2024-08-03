import '../../../../Core/shared/models/author_details.dart';
import 'book_details.dart';
import 'ratings_response.dart';

class BookDetailsModel {
  final BookDetails bookDetails;
  final Rating rating;
  final AuthorDetails author;
  BookDetailsModel({
    required this.bookDetails,
    required this.rating,
    required this.author,
  });
}
