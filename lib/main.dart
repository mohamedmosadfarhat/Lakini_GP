import 'package:flutter/material.dart';
import 'package:lakini_gp/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/register_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/create_password_screen.dart';

import 'features/register/presentation/views/forget_password_screen.dart';
import 'features/register/presentation/views/otp_verification_screen.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const Lakini());
}

class Lakini extends StatelessWidget {
  const Lakini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SplashScreen(),
      routes: {
        ForgetPasswordScreen.fpId: (_) => ForgetPasswordScreen(),
        OtpVerification.otp: (_) => OtpVerification(),
        CreatePasswordScreen.cpId: (_) => CreatePasswordScreen(),
        LoginScreen.id: (_) => const LoginScreen(),
        RegisterScreen.id: (_) => const RegisterScreen(),
        SplashScreen.id: (_) => const SplashScreen(),
        OnBoardingScreen.id: (_) => const OnBoardingScreen(),
      },
    );
  }
}
