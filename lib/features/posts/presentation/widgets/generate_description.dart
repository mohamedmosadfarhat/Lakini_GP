import 'package:flutter/material.dart';

class GenerateDescription extends StatelessWidget {
  const GenerateDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0075FF),
      ),
      child: const Text('Generate\nDescription'),
    );
  }
}
