import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.content,
    required this.buttonText2,
    this.onPressed2,
  });
  final String content;
  final String buttonText2;
  final void Function()? onPressed2;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Are You Sure !'),
      actions: [
        Column(
          children: [
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: Styles.textStyle16,
                )),
            Divider(
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
              color: Colors.grey.withOpacity(0.2),
            ),
            CupertinoDialogAction(
                onPressed: onPressed2,
                child: Text(
                  buttonText2,
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffC92B27)),
                )),
          ],
        ),
      ],
      content: Text(content),
    );
  }
}
