import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';

class AppTheme extends ChangeNotifier {
  static bool _isDarkModeOn = false;

  static bool get isDarkModeOn => _isDarkModeOn;

  void changeAppTheme() {
    _isDarkModeOn = !_isDarkModeOn;
    notifyListeners();
  }

  static final ThemeData _darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme:  AppBarTheme(
        color: kWhite.withOpacity(.2),
        iconTheme:const IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Colors.black,
        onPrimary: Colors.black,
        secondary: Colors.red,
      ),
      cardTheme: const CardTheme(
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      cardColor: kWhite.withOpacity(.2),
      textTheme: TextTheme(
        displayMedium: GoogleFonts.poppins(
          fontSize: 15,
          color: kWhite,
        ),
        displaySmall: TextStyle(color: Colors.white),
        titleMedium: GoogleFonts.poppins(
          fontSize: 13,
          color: kWhite,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.nunito(
          fontSize: 12,
          color: const Color.fromARGB(255, 121, 121, 122),
        ),
      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: kWhite.withOpacity(.2),
        selectedItemColor: kWhite,
        unselectedItemColor: Colors.grey,
      ));

  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.teal,
      appBarTheme: const AppBarTheme(
        color: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: Colors.red,
      ),
      cardTheme: const CardTheme(
        color: Colors.teal,
      ),
      cardColor: kBlack.withOpacity(.2),
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      textTheme: TextTheme(
        displayMedium: GoogleFonts.poppins(
          fontSize: 15,
          color: kBlack,
        ),
        displaySmall: TextStyle(color: Colors.black),
        titleMedium: GoogleFonts.poppins(
          fontSize: 13,
          color: kBlack,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.nunito(
          fontSize: 12,
          color: const Color.fromARGB(255, 42, 42, 42),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kBlack,
        selectedItemColor: kWhite,
        unselectedItemColor: Colors.grey,
      ));

  static ThemeData get lightTheme => _lightTheme;
}
