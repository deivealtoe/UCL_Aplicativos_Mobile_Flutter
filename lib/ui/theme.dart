import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color tema = Color(0xFFEC407A);
const Color yellowClr = Color(0xFFFFB746);
const Color greenClr = Colors.green;
const Color pinkClr = Colors.pink;
const Color primaryClr =tema;
const Color BlueClr = Colors.blue;

class Themes{
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light
  );  
}
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,      
    )
  );
}
TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
    )
  );
}

TextStyle get titleStile{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,      
    )
  );
}
TextStyle get subtitleStile{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,      
    )
  );
}