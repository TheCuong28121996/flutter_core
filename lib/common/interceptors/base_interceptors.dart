import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_env.dart';
import '../../repositories/repositories.dart';
import '../../router/router.dart';
import '../../router/routers.dart';
import '../commons.dart';

class BaseInterceptors extends QueuedInterceptorsWrapper {
  BaseInterceptors({
    required SharedPreferencesRepository sharedPreferencesRepository,
    required Dio dio,
  })  : _sharedPreferencesRepository = sharedPreferencesRepository,
        _dio = dio;

  final SharedPreferencesRepository _sharedPreferencesRepository;
  final Dio _dio;
  final List<Map<dynamic, dynamic>> _failedRequests = [];
  bool _isRefreshToken = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _sharedPreferencesRepository.getAccessToken;

    if (!accessToken.isNullOrEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    DebugLog().printLogRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    DebugLog().printLogResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    DebugLog().printLogError(err);

    if (err.response?.statusCode != 403 && err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (!_isRefreshToken) {
      _isRefreshToken = true;
      await _refreshToken(err, handler);
    } else {
      _failedRequests.add({'err': err, 'handler': handler});
    }
    super.onError(err, handler);
  }

  Future<void> _refreshToken(
      DioException error, ErrorInterceptorHandler handler) async {
    try {
      final response = await _dio.post('${AppEnv().authUrl}/oauth/token',
          data: FormData.fromMap({
            'refresh_token': _sharedPreferencesRepository.getRefreshToken,
            'client_secret': AppEnv().clientSecret,
            'grant_type': 'refresh_token',
            'client_id': AppEnv().clientId
          }));

      _isRefreshToken = false;
      _failedRequests.add({'err': error, 'handler': handler});
      await _retryRequests(
          response.data['access_token'], response.data['refresh_token']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        _sharedPreferencesRepository.logout();

        navigatorKey.currentContext?.go(AppRoutes.login.toPath());

        Future.delayed(const Duration(seconds: 2), () {
          _isRefreshToken = false;
        });
        return handler.reject(error);
      }
    }
  }

  Future<void> _retryRequests(String accessToken, String refreshToken) async {
    _sharedPreferencesRepository.setAccessToken(accessToken);
    _sharedPreferencesRepository.setRefreshToken(refreshToken);

    for (final item in _failedRequests) {
      await _retry(item['err'].requestOptions, item['handler'], accessToken);
    }

    _isRefreshToken = false;
    _failedRequests.clear();
  }

  Future<void> _retry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
    String accessToken,
  ) async {
    if (!accessToken.isNullOrEmpty) {
      requestOptions.headers['Authorization'] = 'Bearer $accessToken';
    }

    await _dio.fetch(requestOptions).then(handler.resolve,
        onError: (error) => handler.reject(error as DioException));
  }
}
