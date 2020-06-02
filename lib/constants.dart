import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryBrown = Color(0xFFa35638);
const Color secondaryBrown = Color(0xFFe08f62);
const Color backgroundLight = Color(0xFFd7c79e);
const Color green = Color(0xFF9dab86);

const labelFontSize = 30.0;
const infoFontSize = 30.0;
const buttonFontSize = 25.0;
const parametersFontSize = 20.0;

TextStyle klabelLatoStyle = GoogleFonts.lato(
  color: primaryBrown,
  fontSize: labelFontSize,
);

TextStyle coffeeOfTheDayStyle = GoogleFonts.lato(
  color: Color(0xFFffffff),
  fontSize: infoFontSize,
);

TextStyle kButtonLatoStyle = GoogleFonts.lato(
  color: Colors.white,
  fontSize: buttonFontSize,
);

TextStyle kLastBrewLatoStyle = GoogleFonts.lato(
  color: backgroundLight,
  fontSize: parametersFontSize,
);