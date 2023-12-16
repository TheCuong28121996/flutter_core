import 'package:dio/dio.dart';

import '../../../common/commons.dart';
import '../../../res/res.dart';

class AuthResponse{
  const AuthResponse({
    this.data,
    this.message,
    required this.success,
  });

  final bool success;
  final String? message;
  final dynamic data;

  factory AuthResponse.fromDioResponse(Response response) {
    try {
      return AuthResponse(
        success: true,
        message: response.statusMessage ?? '',
        data: response.data,
      );
    } catch (error) {
      DebugLog().show('Error creating BaseResponse from Dio response: $error');
      return const AuthResponse(success: false, message: Strings.unknownError);
    }
  }

  factory AuthResponse.fromDioException(DioException e) {
    return AuthResponse(
      success: false,
      message: e.getErrorMsg,
      data: null,
    );
  }
}
