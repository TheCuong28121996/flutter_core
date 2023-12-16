import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/commons.dart';
import '../config/app_env.dart';
import '../repositories/repositories.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // SharedPreferences
  getIt.registerSingleton<SharedPreferencesRepository>(
      SharedPreferencesRepositoryImpl(await SharedPreferences.getInstance()));

  // UI show extensions
  getIt.registerSingleton<UIRepository>(UIRepositoryImpl());

  // Dio auth
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(
        baseUrl: AppEnv().authUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 30)))
      ..interceptors.add(AuthInterceptors()),
    instanceName: 'auth_client',
  );

  // Dio base
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(
        contentType: 'application/json',
        baseUrl: AppEnv().boUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 30)))
      ..interceptors.add(
        BaseInterceptors(
          sharedPreferencesRepository: getIt(),
          dio: getIt(instanceName: 'auth_client'),
        ),
      ),
    instanceName: 'base_client',
  );

// Auth Service
  getIt.registerSingleton<AuthServiceRepository>(
      AuthServiceRepositoryImpl(getIt(instanceName: 'auth_client')));

  // Auth Repository
  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(service: getIt()));

  // base service
  getIt.registerSingleton<BaseServiceRepository>(
      BaseServiceRepositoryImpl(dio: getIt(instanceName: 'base_client')));

  return getIt.allReady();
}
