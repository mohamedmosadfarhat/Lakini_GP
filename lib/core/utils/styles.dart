import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xff0075FF);
const darkGreenColor = Color(0xff00A123);

abstract class Styles {
  static var textStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static var textStyle20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static var textStyle28 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static var textStyle30 = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );
  static const textStyle$20 = TextStyle(
    fontSize: 20,
    //fontWeight: FontWeight.w900,
    // letterSpacing: 1.2,
  );
  static const textStyle50 = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );

  static var textStyle14 = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(153, 153, 153, 1));

  static var textStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static var textStyle60 = GoogleFonts.poppins(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Colors.white,
  ));
}
