import 'package:flutter/material.dart';
import 'package:lakini_gp/features/register/presentation/views/otp_verification_screen.dart';

import '../../../../core/utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String fpId = "ForgetPasswordId";
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/FP.png",
                        height: height * 0.35,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Forget Password?",
                        style: Styles.textStyle60.copyWith(fontSize: 28),
                      ),
                      Text(
                        "Don’t worry! It occurs Please enter the email address Linked with your account.",
                        style: Styles.textStyle14,
                      ),
                      InputField(
                        title: 'Email',
                        hint: 'Enter Your Email',
                        widget: const Icon(
                          Icons.mail_outline,
                          color: Colors.grey,
                        ),
                        textType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (val) {
                          if (val!.isEmpty || !val.contains("@")) {
                            return "Invalid E_Mail!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      MyButton(
                        label: 'Send Code',
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          Navigator.pushNamed(context, OtpVerification.otp);
                        },
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
