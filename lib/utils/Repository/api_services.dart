import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = "https://reqres.in/api";
    _dio.interceptors.add(PrettyDioLogger());
  }
  // getter to access private var out of class
  Dio get sendRequest => _dio;
}
