import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/services/notification_services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../db_references/realtime_reference.dart';
import '../../resources/assets_manager.dart';
import '../../resources/route_manager.dart';
import '../../resources/values_const.dart';
import 'on_bording_screen.dart';

class RegisteredScreen extends StatefulWidget {
  const RegisteredScreen({super.key});

  @override
  State<RegisteredScreen> createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isPasswordVisible = true;
  bool _isvalidate = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Stack(children: [
              /// Stack Containers Bolls
              const SizedBox(
                width: AppSize.s200,
                height: AppSize.s200,
                child: Image(
                  image: AssetImage(ImageAssets.logo2),
                  fit: BoxFit.fill,
                ),
              ),
              const Positioned(
                left: AppPadding.p250,
                top: AppPadding.p300,
                child: SizedBox(
                  width: AppSize.s100,
                  height: AppSize.s100,
                  child: Image(
                    image: AssetImage(ImageAssets.logo2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: AppPadding.p450,
                child: SizedBox(
                  width: AppSize.s150,
                  height: AppSize.s150,
                  child: Image(
                    image: AssetImage(ImageAssets.logo2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Registeretion fields
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p80, horizontal: AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.welcome,
                        style: UpdateUser.customTextStyle(
                            MediaQuery.of(context).size.width / 8,
                            FontWeightManager.medium,
                            ColorManager.black)),
                    const SizedBox(
                      height: AppSize.s70,
                    ),

                    /// TextField 1
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          cursorColor: ColorManager.black,
                          controller: usernamecontroller,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: ColorManager.black),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorManager.white,
                                ),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorManager.theame200),
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
                              labelText: AppString.labeltextU,
                              hintText: AppString.hinttextU),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),

                    /// TextField 2
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          key: const ValueKey('email'),
                          style: TextStyle(color: ColorManager.black),
                          cursorColor: ColorManager.black,
                          controller: emailcontroller,
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
                                  borderSide:
                                      BorderSide(color: ColorManager.theame200),
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
                      height: AppSize.s10,
                    ),

                    /// TextField 3
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          style: TextStyle(color: ColorManager.black),
                          cursorColor: ColorManager.black,
                          controller: passwordcontroller,
                          obscureText: isPasswordVisible,
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
                                  borderSide:
                                      BorderSide(color: ColorManager.theame200),
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
                              hintText: AppString.hinttextP,
                              suffixIcon: IconButton(
                                icon: isPasswordVisible
                                    ?  Icon(
                                  Icons.visibility_off,
                                  size: AppSize.s15,
                                  color: ColorManager.black,
                                )
                                    :  Icon(
                                  Icons.visibility,
                                  size: AppSize.s15,
                                  color: ColorManager.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),

                    /// OutlinedButton
                    Center(
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.light,
                        child: SizedBox(
                          width: AppSize.s250,
                          height: AppSize.s40,
                          child: OutlinedButton(
                              onPressed: () async {
                                setState(() => _isLoading = true);
                                if (_formkey.currentState!.validate()) {
                                  try {
                                    await RealTime.InsertData(
                                        usernamecontroller.text,
                                        emailcontroller.text);
                                    await RealTime.RegistrationData(
                                        emailcontroller.text,
                                        passwordcontroller.text);
                                    await NotificationServices.showNotification(
                                        title: 'Foodies',
                                        body: 'Registration successful.',
                                    summary: '${emailcontroller}Your Foodies account has been created..');
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBordingScreen(username: usernamecontroller.text,email: emailcontroller.text,)));
                                  } catch (e) {
                                    // ignore: use_build_context_synchronously
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Center(
                                                child: Text(AppString.error)),
                                            content: Text(
                                              e.toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        });
                                  }
                                }
                                setState(() => _isLoading = false);
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      color: ColorManager.loadingcolor)
                                  : Text(AppString.registred,
                                      style: UpdateUser.customTextStyle(
                                          MediaQuery.of(context).size.width /
                                              20,
                                          FontWeightManager.medium,
                                          ColorManager.black))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),

                    /// HStack text (Velocity X)
                    Center(
                      child: HStack([
                        Text(
                          AppString.alreadyregistered,
                          style: UpdateUser.customTextStyle(FontSize.s14,
                              FontWeightManager.light, ColorManager.black),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.loginscreen);
                              //print('yes');
                            },
                            child: Text(
                              AppString.signin,
                              style: Theme.of(context).textTheme.bodyText1,
                            ))
                      ]),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
