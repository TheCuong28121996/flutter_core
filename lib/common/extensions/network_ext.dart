import 'dart:convert';

import 'package:dio/dio.dart';

extension ResponseExt on Response {
  Map<String, dynamic> get decodeData {
    if (data == null || data.toString().isEmpty) {
      return {};
    }
    return json.decode(data.toString());
  }
}

extension DioExceptionExt on DioException {
  String get getErrorMsg {
    switch (type) {
      case DioExceptionType.cancel:
        return 'Yêu cầu đến máy chủ API đã bị hủy.';
      case DioExceptionType.connectionTimeout:
        return 'Kết nối quá hạn.';
      case DioExceptionType.sendTimeout:
        return 'Yêu cầu đã hết thời gian chờ.';
      case DioExceptionType.receiveTimeout:
        return 'Đã hết thời gian nhận phản hồi.';
      case DioExceptionType.badResponse:
        try {
          final errCode = response?.statusCode;
          switch (errCode) {
            case 400:
              return 'Yêu cầu lỗi cú pháp.';
            case 401:
              return 'Quyền truy cập bị từ chối.';
            case 403:
              return 'Máy chủ từ chối thực thi.';
            case 404:
              return 'Không thể kết nối đến máy chủ.';
            case 405:
              return 'Phương thức không được phép.';
            case 500:
              return 'Lỗi máy chủ.';
            case 502:
              return 'Yêu cầu không hợp lệ.';
            case 503:
              return 'Máy chủ đang bảo trì.';
            case 505:
              return 'Không hỗ trợ yêu cầu giao thức HTTP.';
            default:
              return 'Lỗi không xác định.';
          }
        } on Exception catch (_) {
          return 'Lỗi không xác định .';
        }
      case DioExceptionType.unknown:
        if (error.toString().contains('SocketException: Failed host lookup:')) {
          return 'Không có kết nối Internet';
        }
        return message ?? "Lỗi không xác định";
      default:
        return message ?? "Lỗi không xác định.";
    }
  }
}
