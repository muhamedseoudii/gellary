import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  Color lightPrimaryColor = const Color(0xff79A3D3);
  Color darkPrimaryColor = const Color(0xff79A3D3);
  Color secondaryColor = const Color(0xffFF8B6A);
  Color accentColor = const Color(0xffFFD2BB);

  ThemeData get lightTheme => ThemeData(
        backgroundColor: const Color(0xffFBFBFB),
        primaryColor: const Color(0xff79A3D3),
        colorScheme: const ColorScheme.light().copyWith(
          primary: _themeClass.lightPrimaryColor,
          secondary: _themeClass.secondaryColor,
        ),
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xffF5F5F5),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: const Color(0xff79A3D3),
        colorScheme: const ColorScheme.dark().copyWith(
            primary: _themeClass.darkPrimaryColor,
            secondary: _themeClass.secondaryColor),
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        iconTheme: const IconThemeData(color: Colors.white),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
      );
}

ThemeClass _themeClass = ThemeClass();
