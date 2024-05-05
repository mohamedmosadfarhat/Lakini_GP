import 'package:flutter/material.dart';

class GenerateImageContainer extends StatelessWidget {
  const GenerateImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(16),
      height: 96,
      width: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(style: BorderStyle.solid),
        color: const Color.fromRGBO(14, 24, 35, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/fa_gears.png'),
          const Text(
            'Generate Image',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
