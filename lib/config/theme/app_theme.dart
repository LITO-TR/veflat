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

      // iconButtonTheme: const IconButtonThemeData(
      //   style: ButtonStyle(
      //     iconColor: WidgetStatePropertyAll(ColorsCustom.primaryBlack),
      //     backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      //   ),
      // ),
      appBarTheme: const AppBarTheme(
        color: ColorsCustom.primaryWhite,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: ColorsCustom.primaryBlack),
        bodyMedium: TextStyle(color: ColorsCustom.darkGray),
        bodyLarge: TextStyle(
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
