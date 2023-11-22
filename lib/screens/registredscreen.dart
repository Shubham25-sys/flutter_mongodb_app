import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:velocity_x/velocity_x.dart';
import '../resources/route_manager.dart';
import '../resources/values_const.dart';

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
  bool _isvalidate = false;

  void registreadUser(){
  if(emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty){
    Navigator.pushNamed(context, Routes.homescreen);
  }else{
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
              children:[

                /// Stack Containers Bolls
                Material(
                  elevation: 2,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(200)),
                  color: ColorManager.theame100,
                  child: Container(width: AppSize.s200,height: AppSize.s200,
                    decoration: BoxDecoration(color: ColorManager.theame100,
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(200))),),
                ),
                Positioned(
                  left: AppPadding.p250,
                  top: AppPadding.p300,
                  child: Container(width: AppSize.s100,height: AppSize.s100,
                    decoration: BoxDecoration(color: ColorManager.theame100,borderRadius: BorderRadius.circular(200)),),
                ),
                Positioned(
                  top: AppPadding.p450,
                  child: Container(width: AppSize.s150,height: AppSize.s150,
                    decoration: BoxDecoration(color: ColorManager.theame100,borderRadius: BorderRadius.circular(200)),),
                ),

                /// Registeretion fields
                Padding(
                padding:  const EdgeInsets.symmetric(vertical: AppPadding.p80,horizontal: AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.welcome,style: Theme.of(context).textTheme.headline2,),
                    const SizedBox(height: AppSize.s70,),

                    /// TextField 1
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          cursorColor: ColorManager.theame300,
                          controller: usernamecontroller,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.white,),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.theame200),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.red),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.red),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              errorText: _isvalidate ? AppString.validerror :null,
                              border: InputBorder.none,
                              labelText: AppString.labeltextU,
                              hintText: AppString.hinttextU
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s10,),

                    /// TextField 2
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          cursorColor: ColorManager.theame300,
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorManager.white,),
                              borderRadius: BorderRadius.circular(AppSize.s10)
                            ),
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: ColorManager.theame200),
                             borderRadius: BorderRadius.circular(AppSize.s10)
                           ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.red),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                           focusedErrorBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: ColorManager.red),
                               borderRadius: BorderRadius.circular(AppSize.s10)
                           ),
                           errorText: _isvalidate ? AppString.validerror :null,
                           border: InputBorder.none,
                            labelText: AppString.labeltextE,
                            hintText: AppString.hinttextE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s10,),

                    /// TextField 3
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.light,
                        child: TextFormField(
                          cursorColor: ColorManager.theame300,
                          controller: passwordcontroller,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.white,),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.theame200),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorManager.red),
                                borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.red),
                                  borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              errorText: _isvalidate ? AppString.validerror : null,
                              border: InputBorder.none,
                              labelText: AppString.labeltextP,
                              hintText:  AppString.hinttextP
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s40,),

                    /// OutlinedButton
                    Center(
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.light,
                        child: SizedBox(
                          width: AppSize.s250,
                          height: AppSize.s40,
                          child: OutlinedButton(onPressed: (){registreadUser();},
                              style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                              child:  Text(AppString.registred,style: Theme.of(context).textTheme.bodyLarge,)),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s40,),


                    /// HStack text (Velocity X)
                    Center(
                      child: HStack([
                        const Text(AppString.alreadyregistered),
                        GestureDetector(onTap:(){
                          Navigator.pushNamed(context, Routes.loginscreen);
                          //print('yes');
                        },
                            child: Text(AppString.signin,style: Theme.of(context).textTheme.bodyText1,))
                      ]),
                    )
                  ],
                ),
              ),
          ]
            ),
          ),
        ),
      ),
    );
  }
}
