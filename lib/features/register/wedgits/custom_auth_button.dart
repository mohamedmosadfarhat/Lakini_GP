import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double buttonWidth = screenSize.width * 0.87;
    double buttonHeight = 48.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Styles.textStyle16,
      ),
    );
  }
}
