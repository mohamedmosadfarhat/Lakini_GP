
import 'package:flutter/material.dart';

class ModelTypeIcon extends StatelessWidget {
  const ModelTypeIcon(
      {super.key,
      required this.width,
      required this.modelType,
      required this.onTap,
      required this.color,
      required this.text});

  final double width;
  final int modelType;
  final Function()? onTap;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * .15, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
