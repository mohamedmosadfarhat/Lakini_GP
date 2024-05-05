import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errText});
  final String errText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: const Color(0xff0E1823),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                errText,
                textAlign: TextAlign.center,
                style: Styles.textStyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
