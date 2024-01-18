import 'package:flutter/material.dart';
import 'package:lakini/features/splash/presentation/views/splash_screen.dart';


void main() {
  runApp(const Lakini());
}
class Lakini extends StatelessWidget {
  const Lakini({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}