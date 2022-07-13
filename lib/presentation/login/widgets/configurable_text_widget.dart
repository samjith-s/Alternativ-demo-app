
import 'package:demo/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigurableText extends StatelessWidget {
  const ConfigurableText({
    Key? key,
    required this.text,
    this.color = kBlack,
    this.size = 25,
    this.weight = FontWeight.bold,
  }) : super(key: key);

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
