import 'package:dio/dio.dart';

import '../../features/register/helper/end_point.dart';

class ApiService {
   final _baseUrl = 'https://wdw888lb-7075.uks1.devtunnels.ms/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {
      _dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
