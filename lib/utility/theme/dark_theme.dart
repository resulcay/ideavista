import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideavista/utility/constant/color/color.dart';
import 'package:ideavista/utility/theme/theme_manager.dart';

final class DarkTheme implements ThemeManager {
  @override
  ThemeData get theme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.comfortaaTextTheme(),
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
