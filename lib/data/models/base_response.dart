import 'dart:convert';
import 'package:base_project/common/commons.dart';
import 'package:base_project/res/res.dart';
import 'package:dio/dio.dart';

class BaseResponse<T> {
  BaseResponse({
    required this.success,
    required this.data,
    required this.errorMessage,
    this.headers,
  });

  final bool success;
  final String errorMessage;
  final T? data;
  final Headers? headers;

  factory BaseResponse.fromDioResponse(Response response) {
    try {
      if (response.data is Map) {
        return BaseResponse(
          success: response.data['success'] ?? false,
          errorMessage: response.data['errorMessage'] ?? '',
          data: response.data['data'],
        );
      }

      final dataMap = _decodeData(response);
      return BaseResponse(
        success: dataMap['success'] ?? false,
        errorMessage: dataMap['errorMessage'] ?? '',
        data: dataMap['data'],
      );
    } catch (error) {
      logger.e('Error creating BaseResponse from Dio response: $error');
      return BaseResponse(
        success: false,
        errorMessage: Strings.unknownError,
        data: null,
      );
    }
  }

  factory BaseResponse.fromDioException(DioException e) {
    return BaseResponse(
      success: false,
      errorMessage: getErrorMsg(e),
      data: null,
    );
  }

  factory BaseResponse.fromDioRawResponse(Response response) {
    return BaseResponse(
        success: true,
        errorMessage: response.statusMessage ?? '',
        data: response.data,
        headers: response.headers);
  }

  factory BaseResponse.fromDioRawException(DioException e) {
    return BaseResponse(
        success: false,
        errorMessage: getErrorMsg(e),
        headers: e.response?.headers,
        data: null);
  }

  static Map<String, dynamic> _decodeData(Response response) {
    if (response.data == null || response.data.toString().isEmpty) {
      return {};
    }
    return json.decode(response.data.toString());
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
