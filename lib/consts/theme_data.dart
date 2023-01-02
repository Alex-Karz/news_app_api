import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(BuildContext context , bool isDarkTheme) {
    return ThemeData(
        appBarTheme: AppBarTheme(color: isDarkTheme ? Colors.white : Colors.blueGrey),
      scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF00001a) : const Color.fromRGBO(253, 253, 252, 1),
      primaryColor: Colors.blueGrey,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDED),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor: isDarkTheme ? const Color.fromRGBO(36, 36, 35, 1) : const Color.fromRGBO(230, 230, 229, 1),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),

      ),
    );
  }
}

