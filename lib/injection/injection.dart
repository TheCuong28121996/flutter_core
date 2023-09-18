import 'package:base_project/common/commons.dart';
import 'package:base_project/common/utils/ui/ui_repository.dart';
import 'package:base_project/common/utils/ui/ui_repository_impl.dart';
import 'package:base_project/config/app_env.dart';
import 'package:base_project/data/repositories/repositories.dart';
import 'package:base_project/data/services/services.dart';
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

  getIt.registerSingleton<AuthServiceRepository>(
      AuthServiceRepositoryImpl(dio: getIt(instanceName: 'auth_client')));

  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(service: getIt()));

  getIt.registerSingleton<UIRepository>(UIRepositoryImpl());

  return getIt.allReady();
}
