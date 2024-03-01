

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://wdw888lb-7075.uks1.devtunnels.ms",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    String? accept,
    required String content,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'accept': accept,
      'Content-Type': content,
    };

    return dio!
        .post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    String? accept,
    required String content,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'accept': accept,
      'Content-Type': content,
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
