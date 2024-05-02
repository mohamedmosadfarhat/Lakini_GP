/* 

import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/register/widgets/custom_button.dart';

import '../../services/city_view_model.dart';
import '../widgets/custom_drop_down_button.dart';

class ChooseLocation extends StatefulWidget {
  static const String locationId = 'location Screen';

  const ChooseLocation({

    super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
bool isExpanded = false;
CityViewModel cityViewModel = CityViewModel();



class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void initState() {
    super.initState();
    cityViewModel.fetchCityNames();
  }
  @override
  Widget build(BuildContext context) {
    final routeArg =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String? type = routeArg["type"];
    final TextEditingController controller = routeArg["controller"];
    return Scaffold(

      appBar: AppBar(
        title:  Text("Choose The Location",style: Styles.textStyle18,),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xff000e1e),

      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff011730),
                Color(0xff00070F),
                Color(0xff00070F),
                Color(0xff000205),
                Color(0xff000205),
                Color(0xff011730),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomDropDownButtonNew(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                      cityViewModel.cityNames;
                    });
                  },
                  hintText: 'Enter location of $type',
                  listPrefixIcon: Icons.location_on_outlined,
                  isExpanded: isExpanded,
                  suffixIcon: Icons.arrow_drop_down_outlined,
                  prefixIcon: Icons.location_on_outlined,
                  items: cityViewModel.cityNames,
                  searchController: controller,
                ),
                const SizedBox(height: 42,),
                MyButton(label: "Done", onTap: (){Navigator.pop(context);})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */
