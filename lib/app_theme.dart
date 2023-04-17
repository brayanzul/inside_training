import 'package:inside_training/app/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ColorScheme colorScheme = const ColorScheme(
    primary: Color(0xFF633EFF),
    primaryVariant: Color(0xFF7F65F4),
    secondary:Color(0xFF00C8CB),
    secondaryContainer: Color(0xFFFF2E80),
    background: Color(0xFF636363),
    surface: Color(0xFF808080),
    onBackground: Colors.white,
    error: Colors.redAccent, 
    onError: Colors.redAccent,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF241E30),
    onSurface: Color(0xFF322942),
    brightness: Brightness.light,
    onTertiaryContainer: Color(0xFFFFE801));

  static const double paddingV = 10.0;
  static const double paddingH = 20.0;

  ThemeData theme() {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'Avenir',
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: colorScheme.primary,
        elevation: 0.0,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(color: Colors.cyan),

      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(
          color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        headline4: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(
          color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
          decorationColor: Colors.red,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.resolveWith<BorderSide>((states) {
            if(states.contains(MaterialState.disabled)) {
              return const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ); // Disabled color
            }
            return BorderSide(
              width: 1.0,
              color: colorScheme.primary,
            ); // Regular color
          }),
          elevation: MaterialStateProperty.resolveWith((states) => 2.0),
          padding: MaterialStateProperty.resolveWith((states) => 
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.disabled)) {
              return Colors.grey; // Disabled color
            }
            return colorScheme.primary; // Regular color
          }),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      )
    );
  }
}
