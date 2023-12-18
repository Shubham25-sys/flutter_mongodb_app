import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';

import '../../resources/colors_const.dart';
import '../../resources/route_manager.dart';
import '../../resources/string_const.dart';

class DonePopup extends StatefulWidget {
  const DonePopup({super.key});

  @override
  State<DonePopup> createState() => _DonePopupState();
}

class _DonePopupState extends State<DonePopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1,
        child: ListView(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:Image(image: AssetImage(ImageAssets.foodieslogo),fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppString.thankyou,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 10, FontWeightManager.bold, ColorManager.green),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppString.subtext,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 20, FontWeightManager.regular, ColorManager.black),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width/3,
                      child: ElevatedButton(onPressed: () async{
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: ColorManager.greenbutton),
                        child: Text(AppString.homepop,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/20, FontWeightManager.regular, ColorManager.white),),),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width/3,
                      child: ElevatedButton(onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.popAndPushNamed(context, Routes.loginscreen);
                      },
                        style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: ColorManager.greenbutton),
                        child: Text(AppString.logout,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/20, FontWeightManager.regular, ColorManager.white),),),
                    ),
                  ],
                )
              ],
            ),
          ),]
        ),
      ),
    );
  }
}
