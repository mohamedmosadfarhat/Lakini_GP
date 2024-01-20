import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textType;
  final String? Function(String?)? validator;

  const InputField(
      {required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.textType,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              validator: validator,
              controller: controller,
              keyboardType: textType,
              autofocus: false,
              style: Styles.textStyle60.copyWith(fontSize: 16),
              cursorColor: const Color.fromRGBO(0, 117, 255, 1),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                prefixIcon: widget,
                hintText: hint,
                hintStyle: Styles.textStyle14,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 117, 255, 1),
                      width: 1,
                    )),
              ),
            ),
          ],
        ));
  }
}
