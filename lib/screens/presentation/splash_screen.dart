import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/loginscreen.dart';
import 'package:flutter_mongodb_app/screens/presentation/on_bording_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db_references/realtime_reference.dart';
import '../../resources/colors_const.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   String? email;
   String? username;
   String? fetchedUsername;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalidationData().whenComplete(() async{
      await fetchAndNavigate();
      await Timer(Duration(seconds: 3),(){
        (email == null) && (fetchedUsername == null) ? Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())) : Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBordingScreen(email: email.toString(),username: fetchedUsername.toString(),)));
      });
    });
  }
  Future getvalidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var carryemail = sharedPreferences.getString('email');
    var carryusername = sharedPreferences.getString('username');
    setState(() {
      email = carryemail;
      fetchedUsername = carryusername;
    });
    print(email);
    print(fetchedUsername);
  }
   Future<void> fetchAndNavigate() async{
     String userEmail = email.toString().trim();
     String? username = await RealTime.fetchUsernameByEmail(userEmail);

     setState(() {
       fetchedUsername = username;
     });
     // if (username != null) {
     //   //Provider.of<MyProviders>(context).passusername(fetchedUsername.toString());
     //   Navigator.push(
     //     context,
     //     MaterialPageRoute(
     //       builder: (context) => OnBordingScreen(email:email.toString(),username: fetchedUsername,),
     //     ),
     //   );
     // }else{
     //   print('error');
     // }
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
            AnimatedTextKit(animatedTexts: [TyperAnimatedText(AppString.slogan,textStyle: UpdateUser.customTextStyle(
                MediaQuery.of(context).size.width / 15,
                FontWeightManager.semiBold,
                ColorManager.black),)])
          ],
        ),
      ),
    );
  }
}
