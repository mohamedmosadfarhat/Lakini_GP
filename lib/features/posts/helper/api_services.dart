// import 'dart:convert';
//
// import 'package:dio/dio.dart';
//
// class APIService {
//   //final String _baseURL = 'https://wdw888lb-7075.uks1.devtunnels.ms/api/';
//
//
//   APIService(this.dio);
//
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(BaseOptions(
//       baseUrl: "https://wdw888lb-7075.uks1.devtunnels.ms",
//       receiveDataWhenStatusError: true,
//     ));
//   }
//
//   Future<List<Map<String, dynamic>>> get({required String endPoint}) async {
//     var response = await dio.get('$_baseURL$endPoint');
//     var result = json.decode(response.data);
//     return result;
//   }
//
//   Future<Map<String, dynamic>> post(
//       {required String endPoint,
//       required Map<String, dynamic> data,
//       String? token}) async {
//     dio.options.headers = {
//       "Content-Type": " multipart/form-data",
//       "Authorization": token,
//     };
//     FormData formData = FormData.fromMap(data);
//     var response = await dio.post('$_baseURL$endPoint', data: formData);
//     var result = json.decode(response.data);
//     return result;
//   }
// }
