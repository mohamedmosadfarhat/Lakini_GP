import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xff0075FF);
const darkGreenColor = Color(0xff00A123);

abstract class Styles {
  static var textStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color:Colors.white
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );
  static var textStyle14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color.fromRGBO(153, 153, 153, 1)
  );

  static var textStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color:Colors.white,
  );
  static var textStyle60 = GoogleFonts.poppins(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Colors.white,
  ));
 
}
