import 'package:flutter/material.dart';
import 'package:lakini_gp/features/register/presentation/views/create_password_screen.dart';

import '../../../../core/utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/otp_txt_field.dart';

class OtpVerification extends StatelessWidget {
  static const String otp = "OTPScreen";
  OtpVerification({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController txtController1 = TextEditingController();
  final TextEditingController txtController2 = TextEditingController();
  final TextEditingController txtController3 = TextEditingController();
  final TextEditingController txtController4 = TextEditingController();
  final TextEditingController txtController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<TextEditingController> txtControllers = [
      txtController1,
      txtController2,
      txtController3,
      txtController4,
      txtController5,
    ];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(1, 23, 48, 1),
              Color.fromRGBO(1, 23, 48, 1),
              Color.fromRGBO(0, 7, 15, 1),
              Color.fromRGBO(0, 7, 15, 1),
              Color.fromRGBO(0, 2, 5, 1),
              Color.fromRGBO(1, 23, 48, 1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/otp.png",
                      height: height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    "OTP Verification",
                    style: Styles.textStyle60.copyWith(fontSize: 28),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Enter the verification code we just sent on your email address.",
                    style: Styles.textStyle14,
                  ),
                  SizedBox(height: height * 0.03),
                  OtpVerificationRow(
                    txtController: txtControllers,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Empty Field!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  MyButton(
                    label: 'Verify',
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.pushNamed(context, CreatePasswordScreen.cpId);
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
