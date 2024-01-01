import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/db_references/realtime_reference.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/on_bording_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/route_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void googleSignin() async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    // email = userCredential.user!.email!;
    // email = userCredential.user!.displayName!;
    await RealTime.InsertData(
        userCredential.user!.email!.toString(),
        userCredential.user!.displayName!.toString());
    Navigator.push(context, MaterialPageRoute(builder:(_)=>OnBordingScreen(email:userCredential.user!.email!.toString(),
        username: userCredential.user!.displayName!.toString())));
    print(userCredential.user?.displayName);
  }
  Future<void> fetchAndNavigate() async{
    String userEmail = _emailcontroller.text.trim();
    String? username = await RealTime.fetchUsernameByEmail(userEmail);

    setState(() {
      fetchedUsername = username;
      _isLoading = true;
    });
      if (username != null) {
        //Provider.of<MyProviders>(context).passusername(fetchedUsername.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBordingScreen(email:_emailcontroller.text,username: fetchedUsername,),
          ),
        );
        setState(()=>_isLoading = false);
      }else{
        print('error');
      }
  }
  String? fetchedUsername;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isPasswordVisible = true;
  bool _isvalidate = false;
  bool _isLoading = false;
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
      child: Consumer<MyProviders>(
        builder:((context, provider,child)=> Scaffold(
            backgroundColor: ColorManager.white,
            body: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    /// Stack Containers Bolls
                    const SizedBox(
                      width: AppSize.s200,
                      height: AppSize.s200,
                      // foregroundDecoration: BoxDecoration(image: DecorationImage(
                      //   image: AssetImage(ImageAssets.logo2,),fit: BoxFit.cover
                      // )),
                      // decoration: BoxDecoration(
                      //     borderRadius: const BorderRadius.only(
                      //         bottomRight: Radius.circular(200))),
                       child: Image(image: AssetImage(ImageAssets.logo2),fit: BoxFit.fill,),
                    ),
                    const Positioned(
                      left: AppPadding.p250,
                      top: AppPadding.p300,
                      child: SizedBox(
                        width: AppSize.s100,
                        height: AppSize.s100,
                        // decoration: BoxDecoration(
                        //     color: ColorManager.theame100,
                        //     borderRadius: BorderRadius.circular(200)),
                        child: Image(image: AssetImage(ImageAssets.logo2),fit: BoxFit.cover,),
                      ),
                    ),
                    const Positioned(
                      top: AppPadding.p450,
                      child: SizedBox(
                        width: AppSize.s150,
                        height: AppSize.s150,
                        // decoration: BoxDecoration(
                        //     color: ColorManager.theame100,
                        //     borderRadius: BorderRadius.circular(200)),
                        child: Image(image: AssetImage(ImageAssets.logo2),fit: BoxFit.cover,),
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
                            style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 8, FontWeightManager.medium, ColorManager.black),
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
                                obscureText: isPasswordVisible,
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
                                    hintText: AppString.hinttextP,
                                    suffixIcon: IconButton(
                                      icon: isPasswordVisible
                                          ?  Icon(
                                        Icons.visibility_off,
                                        size: AppSize.s20,
                                        color: ColorManager.black,
                                      )
                                          :  Icon(
                                        Icons.visibility,
                                        size: AppSize.s20,
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
                                    onPressed: () async{
                                      // if(_isLoading) return;
                                      setState(()=>_isLoading = true);
                                      //await Future.delayed(const Duration(seconds: 3));

                                      if(_formkey.currentState!.validate()){

                                          if((_emailcontroller.text == 'admin@gmail.com') &&(_passwordcontroller.text == 'Foodiesadmin@123') ){
                                            try{
                                             await RealTime.LoginData(_emailcontroller.text,_passwordcontroller.text);
                                              Navigator.pushNamed(context, Routes.adminpanelscreen);
                                            }catch (e){
                                              // ignore: use_build_context_synchronously
                                              setState(()=>_isLoading = false);
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return  AlertDialog(
                                                      title:
                                                      const Center(child: Text(AppString.error)),
                                                      content: Text(
                                                        e.toString(),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    );
                                                  });
                                            }
                                          }else if(_emailcontroller.text == _emailcontroller.text && _passwordcontroller.text == _passwordcontroller.text){
                                            try{
                                               await RealTime.LoginData(_emailcontroller.text,_passwordcontroller.text);
                                               fetchAndNavigate();
                                               final SharedPreferences sharedPreferences =
                                               await SharedPreferences.getInstance();
                                               await sharedPreferences.setString(
                                                   'email', _emailcontroller.text);
                                               await sharedPreferences.setString(
                                                   'username', fetchedUsername.toString());
                                              //Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBordingScreen(email: _emailcontroller.text,)));
                                            }catch (e){
                                              // ignore: use_build_context_synchronously
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return  AlertDialog(
                                                      title:
                                                      const Center(child: Text(AppString.error)),
                                                      content: Text(
                                                        e.toString(),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    );
                                                  });
                                              setState(()=>_isLoading = false);

                                            }

                                          }else{
                                            print('error');
                                          }
                                      }
                                      _passwordcontroller.clear();
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: const StadiumBorder()),
                                    child:_isLoading ? CircularProgressIndicator(color: ColorManager.loadingcolor) : Text(
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
                                style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/25, FontWeightManager.bold, ColorManager.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                           Center(
                            child: Text(AppString.or,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/25, FontWeightManager.regular, ColorManager.black),),
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
                                    onPressed: () async{
                                      try{
                                        googleSignin();
                                      }catch (e){
                                        // ignore: use_build_context_synchronously
                                        print(e);
                                      }

                                    },
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
            ))),
      ),
    );
  }
}
