import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';

import '../string_const.dart';
import '../values_const.dart';

class Navigationdrawer extends StatelessWidget {
  const Navigationdrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: ColorManager.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Padding(
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
                SizedBox(height: 5,),
                Text('Shubham Wani',style: Theme.of(context).textTheme.subtitle2,),
                SizedBox(height: 2,),
                Text('srwani2508@gmail.com',style: Theme.of(context).textTheme.subtitle2,),

              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(AppString.home,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () {},
          ),
          Divider(
            color: ColorManager.faintgray,

            indent: AppSize.s8,
            endIndent: AppSize.s8,
          ),
          ListTile(
            leading: const Icon(Icons.perm_identity_outlined),
            title: Text(AppString.profile,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () {},
          ),
          Divider(
            color: ColorManager.faintgray,
            indent: AppSize.s8,
            endIndent: AppSize.s8,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: Text(AppString.logout,style: Theme.of(context).textTheme.subtitle1,),
            onTap: () {},
          )
        ],
      );
}
