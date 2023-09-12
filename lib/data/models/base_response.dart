import 'dart:io';
import 'package:dio/dio.dart';

class BaseResponse<T> {
  BaseResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final String message;
  final T? data;

  factory BaseResponse.fromDioResponse(Response<T> response) {
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      return BaseResponse(
        success: true,
        message: '',
        data: response.data,
      );
    } else {
      return BaseResponse(
        success: false,
        message: response.statusMessage ?? '',
        data: null,
      );
    }
  }

  factory BaseResponse.fromDioException(DioException e) {
    return BaseResponse(
      success: false,
      message: getErrorMsg(e),
      data: null,
    );
  }

  static String getErrorMsg(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return 'Yêu cầu đến máy chủ API đã bị hủy.';
      case DioExceptionType.connectionTimeout:
        return 'Kết nối quá hạn.';
      case DioExceptionType.sendTimeout:
        return 'Yêu cầu đã hết thời gian chờ.';
      case DioExceptionType.receiveTimeout:
        return 'Đã hết thời gian nhận phản hồi.';
      case DioExceptionType.unknown:
        return exception.message ?? "Lỗi không xác định";
      case DioExceptionType.badResponse:
        try {
          final errCode = exception.response?.statusCode;
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
          return 'Lỗi không xác định.';
        }
      default:
        return exception.message ?? "Lỗi không xác định";
    }
  }
}
