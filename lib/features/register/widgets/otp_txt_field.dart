import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/styles.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField({
    super.key,
    required this.controller,
 
  });

  final TextEditingController controller;
 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width*0.12,
      height: height*0.09,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        controller: controller,
        keyboardType: TextInputType.number,
    
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
      {required this.txtController, super.key});
  final List<TextEditingController> txtController;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 5.0,right: 4),
          child: OtpTextFormField(
            controller: txtController[index],
          
          ),
        ),
      ),
    );
  }
}
