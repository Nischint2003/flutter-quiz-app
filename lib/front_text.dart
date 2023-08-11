import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: camel_case_types, must_be_immutable
class style_text extends StatelessWidget {
  style_text(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.playfairDisplay(
          fontSize: 22, fontWeight: FontWeight.w200, color: Colors.white),
    );
  }
}
