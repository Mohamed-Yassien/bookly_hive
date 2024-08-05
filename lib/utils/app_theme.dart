import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static lightTheme(Color primaryColor) => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
            side: BorderSide.none,
          ),
        ),
      );
  static Brightness get currentSystemBrightness =>
      PlatformDispatcher.instance.platformBrightness;

  static darkTheme(Color primaryColor) => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
            side: BorderSide.none,
          ),
        ),
      );

  static bool isDarkTheme(context) =>
      Theme.of(context).brightness == Brightness.dark;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
