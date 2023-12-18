import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_const.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
              child: const Image(image: AssetImage(ImageAssets.discount1),fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
