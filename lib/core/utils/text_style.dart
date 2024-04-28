import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle({
  Color color = Colors.white,
  double fontSize = 27,
  FontWeight fontWeight = FontWeight.w900,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.cairo().fontFamily);
}

TextStyle getbodyStyle({
  Color color = const Color(0xff121212),
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.cairo().fontFamily);
}

TextStyle getSmallStyle({
  Color color = Colors.grey,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
