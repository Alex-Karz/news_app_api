
import 'package:flutter/material.dart';
import 'package:news_app_api/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getThemeColor => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => getThemeColor ? Colors.white : Colors.black;

}