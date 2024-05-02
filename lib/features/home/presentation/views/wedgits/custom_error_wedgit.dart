import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomErrorWedgit extends StatelessWidget {
  const CustomErrorWedgit({Key? key, required this.errorMsg}) : super(key: key);
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMsg,
      style: Styles.textStyle14,
    );
  }
}
