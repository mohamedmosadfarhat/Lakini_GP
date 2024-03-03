import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

void showSnackBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Styles.textStyle14.copyWith(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  ));
}
