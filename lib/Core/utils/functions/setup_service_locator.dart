import '../../../Features/user/data/repo/user_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo.dart';
import '../services/book_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      createAndSetupDio(),
    ),
  );
  getIt.registerSingleton<UserRepo>(UserRepo());
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(
      homeLocalDataSource: HomeLocalDataSource(),
      homeRemoteDataSource: HomeRemoteDataSource(
        getIt.get<ApiService>(),
      ),
    ),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(milliseconds: 20000)
    ..options.receiveTimeout = const Duration(milliseconds: 20000);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
