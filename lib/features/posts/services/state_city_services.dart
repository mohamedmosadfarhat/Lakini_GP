/* import 'dart:convert';
import 'package:flutter/services.dart';

class CityService {
  Future<List<String>> fetchCityNames() async {
    try {
      String jsonData = await rootBundle.loadString('assets/cities.json');

      List<dynamic> data = json.decode(jsonData)[2]['data'];
      List<String> fetchedCityNames =
          data.map((item) => item['city_name_en'] as String).toList();

      return fetchedCityNames;
    } catch (e) {
      throw Exception('Failed to load city names: $e');
    }
  }
} */
