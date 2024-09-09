import 'package:flutter/material.dart';
import 'expense_tracker.dart';

var kcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 112, 83, 193));
var kDarkcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 146, 111, 244));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkcolorScheme.primary,
          foregroundColor: kDarkcolorScheme.onPrimary),
      cardTheme: const CardTheme().copyWith(
        color: kDarkcolorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kDarkcolorScheme.primary,
        foregroundColor: kDarkcolorScheme.onPrimary,
      )),
      textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kDarkcolorScheme.onSecondaryContainer,
              fontSize: 20),
          bodyLarge: const TextStyle(color: Colors.white), // for textfield
          titleSmall: TextStyle(
              color: kDarkcolorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: kDarkcolorScheme.onPrimary)),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.primary,
          foregroundColor: kcolorScheme.onPrimary),
      cardTheme: const CardTheme().copyWith(
        color: kcolorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kcolorScheme.primary,
              foregroundColor: kcolorScheme.onPrimary,
              padding: const EdgeInsets.all(19))),
      textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kcolorScheme.onSecondaryContainer,
              fontSize: 20),
          bodyLarge: const TextStyle(color: Colors.black), // for textfield
          titleSmall: TextStyle(
              color: kcolorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: kcolorScheme.onPrimary)),
    ),
    themeMode: ThemeMode.dark,
    home: const ExpenseTracker(),
  ));
}
