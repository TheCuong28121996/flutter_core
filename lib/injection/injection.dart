import 'package:base_project/common/commons.dart';
import 'package:base_project/config/app_env.dart';
import 'package:base_project/data/data_source/data_sources.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<SharedPreferencesRepository>(
      SharedPreferencesRepositoryImpl(await SharedPreferences.getInstance()));

  getIt.registerSingleton<Dio>(
      Dio(BaseOptions(
          baseUrl: AppEnv().authUrl,
          connectTimeout: const Duration(seconds: 5)))
        ..interceptors.add(LogInterceptor(
            requestBody: AppEnv().environment != Constants.prodEnvironment,
            responseBody: AppEnv().environment != Constants.prodEnvironment)),
      instanceName: 'auth_client');

  return getIt.allReady();
}
