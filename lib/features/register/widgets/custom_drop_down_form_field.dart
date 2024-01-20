import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomDropDownFormField extends StatelessWidget {
  CustomDropDownFormField(
      {super.key, required this.icon, required this.hintText});
  final IconData icon;
  final String hintText;
  final items = [
    'Alexandria',
    'Cairo',
    'Giza',
    'Gharbia',
    'Luxor',
    'Kafr-ElSheikh',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
            isExpanded: true,
            menuMaxHeight: 250,
            alignment: Alignment.center,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
            ),
            items: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Icon((Icons.location_on_outlined)),
                          Text(e),
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (value) {}),
      ),
    );
  }
}
