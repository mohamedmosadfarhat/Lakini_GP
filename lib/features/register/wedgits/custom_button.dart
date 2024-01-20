import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



class MyButton extends StatelessWidget {
  final String label;
  final Function() onTap;


  const MyButton( {required this.label,required this.onTap,this.isLoading = false, super.key});

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height*0.055,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(0, 117, 255, 1),
        ),
        child: isLoading?  SizedBox(
          height: height*0.02,
          width: width*0.02,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ):Text(
          label,
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
