import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/route_manager.dart';
import '../../resources/values_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isvalidate = false;
  void loginUser() {
    if (_emailcontroller.text.isNotEmpty &&
        _passwordcontroller.text.isNotEmpty) {
      Navigator.pushNamed(context, Routes.homescreen);
    } else {
      setState(() {
        _isvalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.light,
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  /// Stack Containers Bolls
                  Material(
                    elevation: 2,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(200)),
                    color: ColorManager.theame100,
                    child: Container(
                      width: AppSize.s200,
                      height: AppSize.s200,
                      decoration: BoxDecoration(
                          color: ColorManager.theame100,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(200))),
                    ),
                  ),
                  Positioned(
                    left: AppPadding.p250,
                    top: AppPadding.p300,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(200),
                      color: ColorManager.theame100,
                      child: Container(
                        width: AppSize.s100,
                        height: AppSize.s100,
                        decoration: BoxDecoration(
                            color: ColorManager.theame100,
                            borderRadius: BorderRadius.circular(200)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppPadding.p450,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(200),
                      color: ColorManager.theame100,
                      child: Container(
                        width: AppSize.s150,
                        height: AppSize.s150,
                        decoration: BoxDecoration(
                            color: ColorManager.theame100,
                            borderRadius: BorderRadius.circular(200)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p80, horizontal: AppPadding.p8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.headsignin,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: AppSize.s70,
                        ),

                        /// TextFormField 1
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.light,
                            child: TextFormField(
                              style: TextStyle(color:ColorManager.black),
                              cursorColor: ColorManager.black,
                              controller: _emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorManager.white,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager.theame200),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ColorManager.red),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ColorManager.red),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  labelStyle: TextStyle(color: ColorManager.black),
                                  hintStyle: TextStyle(color: ColorManager.black),
                                  errorText:
                                      _isvalidate ? AppString.validerror : null,
                                  border: InputBorder.none,
                                  labelText: AppString.labeltextE,
                                  hintText: AppString.hinttextE),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),

                        /// TextFormField 2
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.light,
                            child: TextFormField(
                              style: TextStyle(color:ColorManager.black),
                              cursorColor: ColorManager.black,
                              obscureText: true,
                              controller: _passwordcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorManager.white,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager.theame200),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ColorManager.red),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ColorManager.red),
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10)),
                                  labelStyle: TextStyle(color: ColorManager.black),
                                  hintStyle: TextStyle(color: ColorManager.black),
                                  errorText:
                                      _isvalidate ? AppString.validerror : null,
                                  border: InputBorder.none,
                                  labelText: AppString.labeltextP,
                                  hintText: AppString.hinttextP),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),

                        /// Login Button
                        Center(
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.light,
                            child: SizedBox(
                              width: AppSize.s250,
                              height: AppSize.s40,
                              child: OutlinedButton(
                                  onPressed: () {
                                    loginUser();
                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: const StadiumBorder()),
                                  child: Text(
                                    AppString.logintext,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.registredscreen);
                            },
                            child: Text(
                              AppString.createac,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        const Center(
                          child: Text(AppString.or),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.transparent,
                          child: SizedBox(
                              width: AppSize.s200,
                              height: AppSize.s40,
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: const StadiumBorder()),
                                  child:  Row(
                                    children: [Image.asset(ImageAssets.googlelogo),
                                      Padding(
                                        padding:  const EdgeInsets.only(left: AppPadding.p20),
                                        child: Text(AppString.googlesignin,style: Theme.of(context).textTheme.labelMedium,),
                                      )],
                                  ))))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
