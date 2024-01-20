import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double buttonWidth = screenSize.width * 0.9;
    double buttonHeight = 48.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(color: Colors.white),
      ),
    );
  }
}
