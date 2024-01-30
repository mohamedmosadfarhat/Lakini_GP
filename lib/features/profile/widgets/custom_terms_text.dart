import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomTermsTextContainer extends StatelessWidget {
  const CustomTermsTextContainer(
      {Key? key,
      required this.textColor,
      required this.title,
      required this.text})
      : super(key: key);
  final Color textColor;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xff0A1120).withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle18
                .copyWith(fontWeight: FontWeight.bold, color: textColor),
          ),
          Text(
            text,
            style: Styles.textStyle14,
          ),
        ],
      ),
    );
  }
}
