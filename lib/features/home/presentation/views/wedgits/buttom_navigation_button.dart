import 'package:flutter/material.dart';

class ButtomNavigationButton extends StatelessWidget {
  void Function()? onPressed;
  IconData? icon;
  String hint;
  Color? color;
  ButtomNavigationButton({
    required this.onPressed,
    required this.icon,
    required this.hint,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(children: [
          Icon(icon, color: color),
          Text(hint, style: TextStyle(color: color, fontSize: 11))
        ]),
      ),
    );
  }
}
