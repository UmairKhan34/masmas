import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  TextStyle bentonSansBold(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return TextStyle(
        fontFamily: 'BentonSans Bold',
        fontSize: size,
        fontWeight: weight,
        decoration: decoration,
        color: color);
  }

  TextStyle bentonSansBook(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return TextStyle(
        fontFamily: 'BentonSans Book',
        fontSize: size,
        fontWeight: weight,
        decoration: decoration,
        color: color);
  }

  TextStyle bentonSansRegularRegular(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return TextStyle(
        fontFamily: 'BentonSans Regular Regular',
        fontSize: size,
        fontWeight: weight,
        decoration: decoration,
        color: color);
  }

  TextStyle bentonSansMedium(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return TextStyle(
        fontFamily: 'BentonSans Medium',
        fontSize: size,
        fontWeight: weight,
        decoration: decoration,
        color: color);
  }

  TextStyle googleFontRubik(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return GoogleFonts.rubik(
        fontSize: size,
        decoration: decoration,
        fontWeight: weight,
        color: color);
  }

  TextStyle googleFontRoboto(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return GoogleFonts.roboto(
        fontSize: size,
        decoration: decoration,
        fontWeight: weight,
        color: color);
  }

  TextStyle googleFontPoppins(
      FontWeight weight, double size, TextDecoration decoration, Color? color) {
    return GoogleFonts.poppins(
        fontSize: size,
        decoration: decoration,
        fontWeight: weight,
        color: color);
  }
}
