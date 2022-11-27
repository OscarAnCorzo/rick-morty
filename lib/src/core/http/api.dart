import 'package:dio/dio.dart';
import 'app_interceptors.dart';

class ApiProvider {
  Dio? dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
    dio?.interceptors.add(AppInterceptors());
  }
}