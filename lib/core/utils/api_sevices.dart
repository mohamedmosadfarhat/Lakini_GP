import 'package:dio/dio.dart';

class ApiService {
   final _baseUrl = 'https://wdw888lb-7075.uks1.devtunnels.ms/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {

    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
