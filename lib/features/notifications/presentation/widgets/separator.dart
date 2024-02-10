import 'package:flutter/material.dart';

class Seprator extends StatelessWidget {
  const Seprator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 390,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0),
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror),
      ),
    );
  }
}
