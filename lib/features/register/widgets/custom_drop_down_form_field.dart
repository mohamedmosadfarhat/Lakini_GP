import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField({
    Key? key,
    this.icon,
    required this.hintText,
    required this.items,
    required this.onItemSelected, // Add onItemSelected callback
  }) : super(key: key);

  final IconData? icon;
  final String hintText;
  final List<dynamic> items;
  final Function(dynamic)? onItemSelected; // Define onItemSelected callback

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
            prefixIcon: icon != null ? Icon(icon) : null,
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
                        Text(e),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            onItemSelected!(value); // Call the provided onItemSelected callback
          },
        ),
      ),
    );
  }
}
