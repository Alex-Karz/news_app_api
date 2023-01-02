import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWidget extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String text;
  final Function onTap;
  const TabsWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: GoogleFonts.ubuntu(fontSize: fontSize, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
