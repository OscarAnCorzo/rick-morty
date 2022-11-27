import 'dart:io';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler,) async {
    switch (err.type) {
      case DioErrorType.response:
        if (err.response?.statusCode == 401 && err.response?.data['status'] == 'El token ha expirado') {
          
        }
      break;
      default:
        break;
    }

    return super.onError(err, handler);
  }
}
