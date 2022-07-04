import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get headingTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get inputTextTitleTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400));
}

TextStyle get inputTextSubTitleTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400));
}

TextStyle get buttonTextStyle {
  return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
