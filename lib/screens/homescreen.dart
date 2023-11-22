import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.theame200,
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: IconButton(onPressed: (){Navigator.pop(context);},
              icon:const Icon(Icons.arrow_back,color: Colors.white,))),
          HStack(['Under Development...'.text.make()]),
        ],
      )),
    );
  }
}
