import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CutsomTextField extends StatelessWidget {
  const CutsomTextField(
      {super.key,
      required this.hintText,
      this.textEditingController,
      this.icon});
  final String hintText;
  final IconData? icon;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextField(
        controller: textEditingController,
        cursorColor: mainColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: mainColor),
          ),
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          hintStyle: Styles.textStyle16.copyWith(color: Colors.grey.shade800),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
