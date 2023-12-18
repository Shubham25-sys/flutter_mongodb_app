import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: (){

          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              //color: ColorManager.faintgray,
              child: const Image(image: AssetImage(ImageAssets.discount2),fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
