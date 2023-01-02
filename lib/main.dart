import 'package:flutter/material.dart';
import 'package:news_app_api/consts/theme_data.dart';
import 'package:news_app_api/providers/dark_theme_provider.dart';
import 'package:news_app_api/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  Future<void> getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){

          return MaterialApp(
            title: 'News App',
            theme: Style.themeData(context, themeProvider.getDarkTheme),
            home: const HomeScreen(),
            routes: {},
          );
        },

      ),
    );
  }
}
