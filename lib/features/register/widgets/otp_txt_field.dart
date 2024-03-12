import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/styles.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        controller: controller,
        keyboardType: TextInputType.number,
        validator: validator,
        style: Styles.textStyle60.copyWith(fontSize: 16),
        cursorColor: const Color.fromRGBO(0, 117, 255, 1),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 117, 255, 1),
                width: 1,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 1,
              )),
        ),
      ),
    );
  }
}

class OtpVerificationRow extends StatelessWidget {
  const OtpVerificationRow(
      {required this.txtController, required this.validator, super.key});
  final List<TextEditingController> txtController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: OtpTextFormField(
            controller: txtController[index],
            validator: validator,
          ),
        ),
      ),
    );
  }
}
