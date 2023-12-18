import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';

import '../../resources/colors_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2),(){
      Navigator.pushNamed(context, Routes.loginscreen);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(image: AssetImage(ImageAssets.foodieslogo),fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              AppString.slogan,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 15,
                  FontWeightManager.semiBold,
                  ColorManager.black),
            )
          ],
        ),
      ),
    );
  }
}
