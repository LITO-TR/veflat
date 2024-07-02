import 'package:flutter/material.dart';
import 'package:veflat/config/theme/colors_custom.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsCustom.primaryBlack,
        primary: ColorsCustom.primaryBlack,
      ),
      iconTheme: const IconThemeData(
        color: ColorsCustom.primaryBlack,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: ColorsCustom.primaryBlack),
        bodyMedium: TextStyle(color: ColorsCustom.darkGray),
        bodySmall: TextStyle(
            color: ColorsCustom.primaryBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        labelLarge: TextStyle(color: ColorsCustom.primaryWhite),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: ColorsCustom.primaryBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
