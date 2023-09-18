import 'package:base_project/main.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as developer;

final logger = Logger(filter: _Log());

class _Log extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return kDevEnv || kStgEnv;
  }
}

class DebugLog {
  DebugLog._init();

  static final DebugLog _instance = DebugLog._init();

  factory DebugLog() {
    return _instance;
  }

  void show(String? msg) {
    developer.log(msg ?? '', name: '${DateTime.now()} DevDebug:');
  }
}
