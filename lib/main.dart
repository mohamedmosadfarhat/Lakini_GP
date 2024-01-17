import 'package:flutter/material.dart';
import 'package:lakini_gp/features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const Lakini());
}
class Lakini extends StatelessWidget {
  const Lakini({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}