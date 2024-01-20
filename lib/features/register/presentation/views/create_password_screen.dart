import 'package:flutter/material.dart';
import 'package:lakini_gp/features/register/presentation/views/otp_verification_screen.dart';

import '../../../../core/utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const String cpId = "CreatePasswordId";
  CreatePasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                      Text(
                        "Create new password",
                        style: Styles.textStyle60.copyWith(fontSize: 28),
                      ),
                      Text(
                        "Your new password must unique from those previously used.",
                        style: Styles.textStyle14,
                      ),
                      InputField(
                        title: 'New Password',
                        hint: 'Enter Password',
                        widget: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                        ),
                        textType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty || val.length < 5) {
                            return "Password Is Too Short!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      InputField(
                          title: 'Confirm Password',
                          hint: 'Enter Confirm Password',
                          widget: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          textType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return "Password Don't Match!";
                            }
                            return null;
                          }),
                      SizedBox(height: height * 0.03),
                      MyButton(
                        label: 'Set Password',
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
