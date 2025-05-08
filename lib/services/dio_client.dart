import 'package:dio/dio.dart';
import 'package:flutter_app/env.dart';

export 'package:dio/dio.dart' show DioException;

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    init();
  }

  void init() {
    dio.options.baseUrl = EnvConfig.baseUrl;
    dio.interceptors.add(LogInterceptor());
  }

  String getFileUrl(String filePath) {
    return '${EnvConfig.cdnUrl}/$filePath';
  }
}

DioClient dioClient = DioClient(Dio());
