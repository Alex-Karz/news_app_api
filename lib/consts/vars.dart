import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  allNews,
  topTrending,
}

enum SortByEnum {
  relevancy,
  publishedAt,
  popularity,
}

TextStyle largeTextStyle = GoogleFonts.ubuntu(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
TextStyle textStyle = GoogleFonts.ubuntu(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  // color: Colors.black
);
