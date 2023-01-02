import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTilesWidget extends StatelessWidget {
  final String label;
  final Function function;
  final IconData icon;
  const ListTilesWidget({
    Key? key,
    required this.label,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        label,
        style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
