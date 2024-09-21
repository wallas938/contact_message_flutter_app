import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    primaryColor: Colors.deepOrange,
    useMaterial3: true,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepOrange, // Button background color
      textTheme: ButtonTextTheme.primary, // Text color in buttons
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    hintColor: Colors.redAccent,
    dividerColor: Colors.blue[300],
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.pacificoTextTheme());
