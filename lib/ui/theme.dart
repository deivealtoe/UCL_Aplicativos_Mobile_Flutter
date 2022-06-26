import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


const Color tema = Color(0xFFEC407A);
const Color yellowClr = Color(0xFFFFB746);
const Color greenClr = Colors.green;
const Color pinkClr = Colors.pink;
const Color primaryClr =tema;
const Color BlueClr = Colors.blue;
const Color principalClr = Color.fromRGBO(254, 136, 183, 1);
const Color secundariaClr = Color.fromARGB(255, 125, 120, 122);
const Color appBarClr = Color.fromARGB(255, 79, 79, 79);
const Color cadasClr = Color.fromARGB(255, 249, 203, 226);

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
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey
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