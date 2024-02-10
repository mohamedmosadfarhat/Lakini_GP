import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomPopup extends StatelessWidget {
  //const CustomPopup({Key? key}) : super(key: key);
  String hint;
  IconData icon;
  CustomPopup({required this.hint, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hint,
          style: Styles.textStyle16,
        ),
        Icon(icon),
      ],
    );
  }
}
