import 'package:flutter/material.dart';
import 'package:lakini_gp/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/register_screen.dart';

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
      home: const RegisterScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
      },
    );
  }
}
