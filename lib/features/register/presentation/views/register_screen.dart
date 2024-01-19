import 'package:flutter/material.dart';
import 'package:lakini_gp/features/register/wedgits/custom_auth_button.dart';
import 'package:lakini_gp/features/register/wedgits/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(),
        ],
      ),
    );
  }
}
