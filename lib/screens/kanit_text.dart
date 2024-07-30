import 'package:flutter/material.dart';

TextStyle kanitTextStyle({
  bool bold = false,
  Color color = Colors.white,
  double size = 28,
  double? letterSpacing,
}) {
  return TextStyle(
    fontFamily: 'Kanit',
    fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
    color: color,
    fontSize: size,
    letterSpacing: letterSpacing,
  );
}
