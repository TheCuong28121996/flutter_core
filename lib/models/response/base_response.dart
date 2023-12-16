import 'package:dio/dio.dart';

import '../../../common/commons.dart';
import '../../../res/res.dart';

class BaseResponse<T> {
  const BaseResponse({
    this.data,
    this.errorMsg = const [],
    required this.hasError,
  });

  final bool hasError;
  final List<String> errorMsg;
  final T? data;

  String get getMessage => errorMsg.isNotEmpty ? errorMsg.join('\n') : '';

  factory BaseResponse.fromDioResponse(Response response) {
    try {
      if (response.data is Map) {
        return BaseResponse(
          hasError: response.data['HasError'] ?? false,
          errorMsg: response.data['ErrorMessages'] != null
              ? List<String>.from(response.data['ErrorMessages'])
              : [],
          data: response.data,
        );
      }

      final dataMap = response.decodeData;
      return BaseResponse(
        hasError: dataMap['HasError'] ?? false,
        errorMsg: response.data['ErrorMessages'] == null
            ? List<String>.from(response.data['ErrorMessages'])
            : [],
        data: dataMap as T?,
      );
    } catch (error) {
      DebugLog().show('Error creating BaseResponse from Dio response: $error');
      return const BaseResponse(
          hasError: false, errorMsg: [Strings.unknownError]);
    }
  }

  factory BaseResponse.fromDioException(DioException e) {
    return BaseResponse(
      hasError: false,
      errorMsg: [e.getErrorMsg],
      data: null,
    );
  }
}
