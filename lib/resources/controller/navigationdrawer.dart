import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/on_bording_screen.dart';
import 'package:flutter_mongodb_app/screens/presentation/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager.dart';
import '../string_const.dart';
import '../values_const.dart';

class Navigationdrawer extends StatelessWidget {
  final String email;
  final String username;
  Navigationdrawer({super.key, required this.email, required this.username});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: ColorManager.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context,email.toString(),username.toString()),
              buildMenuItems(context,email,username),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context,String email,String username) => Padding(
        padding: const EdgeInsets.only(top: AppPadding.p50,left: AppPadding.p8,right: AppPadding.p8),
        child: Container(
          decoration: BoxDecoration( color: ColorManager.light,borderRadius: BorderRadius.circular(10)),
          height: AppSize.s150,
          width: AppSize.s200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person_pin,size: AppSize.s80,color: ColorManager.white,),
                ),
                const SizedBox(height: AppSize.s5,),
                Text(username == null ? 'Data not fetched!' : username.toString(),style: Theme.of(context).textTheme.subtitle2,),
                const SizedBox(height: AppSize.s2,),
                Text(email.toString(),style: Theme.of(context).textTheme.subtitle2,),

              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context,String email,String username) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(AppString.home,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            color: ColorManager.faintgray,
            indent: AppSize.s8,
            endIndent: AppSize.s8,
          ),
          ListTile(
            leading: const Icon(Icons.perm_identity_outlined),
            title: Text(AppString.profile,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            color: ColorManager.faintgray,
            indent: AppSize.s8,
            endIndent: AppSize.s8,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: Text(AppString.logout,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              sharedPreferences.remove('username');
              Navigator.popAndPushNamed(context, Routes.loginscreen);
            },
          )
        ],
      );
}
