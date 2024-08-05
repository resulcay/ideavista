import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideavista/utility/constant/color/color.dart';
import 'package:ideavista/utility/theme/theme_manager.dart';

final class LightTheme implements ThemeManager {
  @override
  ThemeData get theme => ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.comfortaaTextTheme(),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
