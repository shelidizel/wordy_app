import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WordyTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme(
          primary: const Color(0xFF1EA896),
          primaryContainer: Color.fromARGB(255, 194, 216, 226),
          secondary: const Color(0xFF523F38),
          secondaryContainer: const Color(0xFF048BA8).withOpacity(0.5),
          surface: const Color(0xFF523F38),
          background: Color.fromARGB(255, 241, 247, 249),
          error: const Color(0xFFFF0000),
          onPrimary: const Color(0xFFFFFFFF),
          onSecondary: const Color(0xFF048BA8),
          onSurface: const Color(0xFF000000),
          onBackground: const Color(0xFFF9F8F1),
          onError: const Color(0xFFFF0000),
          brightness: Brightness.light),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: const Color(0xFF1EA896),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      textTheme: lightTextTheme,
      
    );
  }
}
