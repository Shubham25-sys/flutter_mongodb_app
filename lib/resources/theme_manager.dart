import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';

import 'colors_const.dart';

ThemeData getApplicationTheme(){
 return ThemeData(
   primaryColor:ColorManager.white,
   primaryColorLight: ColorManager.light,

   textTheme: TextTheme(
       headline1: TextStyle(
           fontSize: FontSize.s40,
           color: ColorManager.theame200,
           fontWeight: FontWeightManager.regular
       ),
       headline2: TextStyle(
         // fontSize: FontSize.s40,
           color: ColorManager.theame200,
           fontWeight: FontWeightManager.regular
       ),
       bodyText1:  TextStyle(
         fontSize: FontSize.s18,
         fontWeight: FontWeightManager.medium,
         color: ColorManager.theame300,
       ),
       headline3:  TextStyle(
         // fontSize: FontSize.s14,
         fontWeight: FontWeightManager.medium,
         color: ColorManager.theame300,
       ),
       bodyText2: TextStyle(
           fontSize: FontSize.s14,
           fontWeight: FontWeightManager.semiBold,
           color: ColorManager.theame300
       ),
       labelMedium: TextStyle(
         fontSize: FontSize.s14,
         color: ColorManager.black,
         fontWeight: FontWeightManager.medium,
       ),
       // labelLarge: TextStyle(
       //   //fontSize: FontSize.s14,
       //   color: ColorManager.black,
       //   fontWeight: FontWeightManager.medium,
       // ),
     subtitle1: TextStyle(
       fontSize: FontSize.s14,
       color: ColorManager.gray,
       fontWeight: FontWeightManager.regular
     ),
     subtitle2: TextStyle(
       color: ColorManager.black,
       fontWeight: FontWeightManager.medium
     ),
     caption: TextStyle(
       color: ColorManager.gray
     )
   ),
 );
}
class UpdateUser {
  static TextStyle customTextStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
     // fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
}