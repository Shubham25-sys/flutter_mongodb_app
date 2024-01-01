import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/controller/scroll_to_hide_widget.dart';
import '../../resources/route_manager.dart';

class ProfileScreen extends StatefulWidget {
  final String email;
  final String username;
  ProfileScreen({super.key, required this.email, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController controller;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: Text(' '),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        title: Text(
          AppString.profile,
          style: UpdateUser.customTextStyle(
              MediaQuery.of(context).size.width / 15,
              FontWeightManager.medium,
              ColorManager.white),
        ),
        backgroundColor: ColorManager.theame100,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      /// Insert Image TODO
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorManager.faintgray,
                    radius: AppSize.s50,
                    child: const Icon(Icons.camera_enhance_rounded),
                  ),
                ),
              ),
              Text(widget.username == null ? 'Data not fetched!':
                widget.username.toString(),
                style: UpdateUser.customTextStyle(
                    MediaQuery.of(context).size.width / 20,
                    FontWeightManager.semiBold,
                    ColorManager.black),
              ),
              Text(widget.email.toString(),
                  style: UpdateUser.customTextStyle(
                      MediaQuery.of(context).size.width / 30,
                      FontWeightManager.semiBold,
                      ColorManager.gray)),
            ],
          ),
          Divider(
            thickness: 1,
            color: ColorManager.gray,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: ColorManager.black,
            ),
            title: Text(
              AppString.setting,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 20,
                  FontWeightManager.regular,
                  ColorManager.black),
            ),
            subtitle: Text(
              AppString.settingsubtitle,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 30,
                  FontWeightManager.regular,
                  ColorManager.gray),
            ),
            onTap: () {
              setState(() {
                print('taped');
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: ColorManager.black,
            ),
            title: Text(
              AppString.language,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 20,
                  FontWeightManager.regular,
                  ColorManager.black),
            ),
            subtitle: Text(
              AppString.languagesubtitle,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 30,
                  FontWeightManager.regular,
                  ColorManager.gray),
            ),
            onTap: () {
              setState(() {
                print('taped');
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: ColorManager.black,
            ),
            title: Text(
              AppString.logout,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 20,
                  FontWeightManager.regular,
                  ColorManager.black),
            ),
            subtitle: Text(
              AppString.logoutsubtitle,
              style: UpdateUser.customTextStyle(
                  MediaQuery.of(context).size.width / 30,
                  FontWeightManager.regular,
                  ColorManager.gray),
            ),
            onTap: () {
              setState(() async{
                await FirebaseAuth.instance.signOut();
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                 sharedPreferences.remove('email');
                 sharedPreferences.remove('username');
                Navigator.popAndPushNamed(context, Routes.loginscreen);
                print('taped');
              });
            },
          )
        ],
      ),
      //bottomNavigationBar: bottomnavigationbar,
    );
  }
  // Widget get bottomnavigationbar {
  //   return ClipRRect(
  //     borderRadius: const BorderRadius.only(
  //         topLeft: Radius.circular(0), topRight: Radius.circular(0)),
  //     child: BottomNavigationBar(
  //       backgroundColor: ColorManager.theame100,
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: IconButton(
  //               onPressed: () {
  //                 Navigator.pushNamed(context, Routes.homescreen);
  //               }, icon: Icon(Icons.home_outlined,color: ColorManager.black,size: AppSize.s30,),
  //             ),
  //             label: ''),
  //         BottomNavigationBarItem(
  //             icon: IconButton(
  //               onPressed: () {
  //                 Navigator.pushNamed(context, Routes.orderscreen);
  //               },
  //               icon: Icon(
  //                 Icons.notifications_none_outlined,
  //                 color: ColorManager.black,
  //                 size: AppSize.s30,
  //               ),
  //             ),
  //             label: ''),
  //         BottomNavigationBarItem(
  //             icon: IconButton(
  //               onPressed: () {
  //                 Navigator.pushNamed(context, Routes.profilescreen);
  //               },
  //               icon: Icon(
  //                 Icons.perm_identity_outlined,
  //                 size: AppSize.s30,
  //                 color: ColorManager.black,
  //               ),
  //             ),
  //             label: ''),
  //       ],
  //     ),
  //   );
  // }
}
