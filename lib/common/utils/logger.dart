import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';

import 'package:base_project/main.dart';
import 'package:dio/dio.dart';

class DebugLog {
  DebugLog._init();

  static final DebugLog _instance = DebugLog._init();

  factory DebugLog() {
    return _instance;
  }

  void show(String? msg) {
    developer.log(msg ?? '', name: '${DateTime.now()} DebugLog:');
  }

  void printLogRequest(RequestOptions options) {
    if (kDevEnv || kStgEnv) {
      return;
    }

    logPrint('\n');
    logPrint('***======================== Request ========================***');
    logPrint('--> ${options.method} ${options.uri}');
    options.headers.forEach((key, v) => printKV(key, v));

    if (options.data != null) {
      final dataToPrint =
          options.data is Map ? json.encode(options.data) : options.data;

      printAll(dataToPrint);
    }
  }

  void printLogError(DioException err) {
    if (kDevEnv || kStgEnv) {
      return;
    }

    logPrint('');
    logPrint('--> END ${err.requestOptions.method}');

    final response = err.response;
    if (response != null) {
      logPrint('<-- ${response.statusCode?.toString()} ${err.requestOptions.uri}');
      printAll(response.toString());
    }

    logPrint('$err');
  }

  void printLogResponse(Response response) {
    if (kDevEnv || kStgEnv) {
      return;
    }

    logPrint('');
    logPrint('--> END ${response.requestOptions.method}');
    logPrint('<-- ${response.statusCode} ${response.requestOptions.uri}');
    printAll(jsonEncode(response.data));
    logPrint(
        '***======================== End Request ========================***');
  }

  void logPrint(String msg) {
    log('${DateTime.now()} Api: $msg');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }
}
