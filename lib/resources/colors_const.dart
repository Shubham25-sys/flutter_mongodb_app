import 'package:flutter/material.dart';

class ColorManager {
  static Color white = const Color(0xFFFFFFFF);
  static Color theame200 = const Color(0xFF80CBC4);
  static Color theame100 = const Color(0xFFB2DFDB);
  static Color theame300 = const Color(0xFF4DB6AC);
  static Color light = const Color(0xFFE0F2F1);
  static Color red = const Color(0xFFB71C1C);
  static Color black = const Color(0xFF000000);
  static Color gray = const Color(0xF99E9E9E);
  static Color graynish = const Color(0xFF5F5E5E);
  static Color lightgray = const Color(0xFFE8E8E8);
  static Color faintgray = const Color(0xFFD9D9D9);
  static Color yellow = const Color(0xFFFFD700);
  static Color green = const Color(0xFF28CC00);


}
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString; //8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
  }