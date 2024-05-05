import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomPopup extends StatelessWidget {
  //const CustomPopup({Key? key}) : super(key: key);
  String hint;
  Color? clr;
  IconData icon;
  CustomPopup({required this.hint, required this.icon, this.clr});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hint,
          style: Styles.textStyle14.copyWith(color: clr ?? Colors.white),
        ),
        Icon(
          icon,
          color: clr ?? Colors.white,
        ),
      ],
    );
  }
}
