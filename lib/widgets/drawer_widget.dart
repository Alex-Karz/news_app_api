import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';
import 'list_tile_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Drawer(
      // С помощью Material->color задал цвет фона для выдвижной коробки
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(height: 60, width: 60, fit: BoxFit.contain, 'assets/images/newspaper.png'),
                  ),
                  const VerticalSpacingWidget(
                    height: 20,
                  ),
                  Flexible(
                      child: Text(
                    'News',
                    style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            ListTilesWidget(
              label: 'Home',
              function: () {},
              icon: Icons.home,
            ),
            const VerticalSpacingWidget(
              height: 20,
            ),
            ListTilesWidget(
              label: 'Bookmarks',
              function: () {},
              icon: Icons.bookmark,
            ),
            const VerticalSpacingWidget(
              height: 20,
            ),
            const Divider(
              thickness: 5,
            ),
            SwitchListTile(
                secondary: Icon(
                  themeState.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.yellow, size: 32,
                ),
                title: const Text(
                  'Change Theme',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                value: themeState.getDarkTheme,
                onChanged: (bool value) {
                  themeState.setDarkTheme = value;
                }),
          ],
        ),
      ),
    );
  }
}


