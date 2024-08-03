import '../models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../Core/errors/failure.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepo(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  Future<Either<Failure, List<BookModel>>> fetchTrendingBooks(
      {int pageNumber = 1}) async {
    List<BookModel> booksList;
    try {
      booksList =
          homeLocalDataSource.fetchTrendingBooks(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchTrendingBooks(pageNumber: pageNumber);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDiorError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<BookModel>>> fetchNewestBooks(
      {int pageNumber = 1}) async {
    List<BookModel> books;
    try {
      books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<BookModel>>> fetchRecentViewedBooks() async {
    List<BookModel> books;
    try {
      books = homeLocalDataSource.fetchRecentViewedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
