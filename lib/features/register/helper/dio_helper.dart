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
    required data,
    String? myToken,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'accept': accept,
      'Content-Type': content,
      "Authorization": "Bearer $myToken",
    };

    return dio!.post(
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

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return dio!.get(url, queryParameters: query);
  }

  static Future<Response> deleteData({
    required String url,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return dio!.delete(url);
  }
}
