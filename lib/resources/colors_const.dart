import 'package:flutter/material.dart';

class ColorManager {
  static Color white = const Color(0xFFFFFFFF);
  static Color whitesheed = const Color(0xFFC7C7C7);
  static Color whitesheed2 = const Color(0xFFF2F2F2);
  static Color dividercolor = const Color(0xFFF1E8E8);
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
  static Color graybg = const Color(0xFFEEE5E5);
  static Color yellow = const Color(0xFFFFD700);
  static Color orangelight = const Color(0xFFF3B457);
  static Color green = const Color(0xFF28CC00);
  static Color greenbutton = const Color(0xFF81DB72);
  static Color greennish = const Color(0xFF8BF6A3);
  static Color loadingcolor = const Color(0xFF4892D7);




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