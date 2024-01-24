import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

Padding customContainer(
    {required BuildContext context,
    required String text,
    required bool isTapped}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      decoration: BoxDecoration(
          color: isTapped ? const Color.fromRGBO(0, 117, 255, 1) : null,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color.fromRGBO(98, 98, 98, 1))),
      child: Center(
        child: Text(
          text,
          style: Styles.textStyle16,
        ),
      ),
    ),
  );
}
