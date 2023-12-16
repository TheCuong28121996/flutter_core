import 'package:dio/dio.dart';

import '../commons.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DebugLog().printLogRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    DebugLog().printLogResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DebugLog().printLogError(err);
    super.onError(err, handler);
  }
}
