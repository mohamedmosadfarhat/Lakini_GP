import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomTextFieldPost extends StatelessWidget {
  const CustomTextFieldPost(
      {super.key,
      required this.hintText,
      this.textEditingController,
      this.enable,
      this.widget,
        this.max,
        this.type,
      this.icon});

  final String hintText;
  final IconData? icon;
  final bool? enable;
  final Widget? widget;
  final int? max;
  final TextInputType? type;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextField(
        style: Styles.textStyle14.copyWith(color: Colors.white),
        enabled: enable,
        controller: textEditingController,
        keyboardType: type,
        cursorColor: mainColor,
        maxLines: max,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: mainColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: mainColor),
          ),
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: icon != null ? Icon(icon) : null,
          suffixIcon: widget,
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
