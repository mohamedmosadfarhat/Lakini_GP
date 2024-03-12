import 'package:flutter/foundation.dart';
import 'package:lakini_gp/features/posts/services/state_city_services.dart';

class CityViewModel extends ChangeNotifier {
  List<String> cityNames = [];
  bool isExpanded = false;

  Future<void> fetchCityNames() async {
    try {
      CityService cityService = CityService();
      List<String> fetchedCityNames = await cityService.fetchCityNames();
      cityNames = fetchedCityNames;
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  void toggleExpansion() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
