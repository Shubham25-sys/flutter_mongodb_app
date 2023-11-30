import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: ColorManager.faintgray,
          ),
        ),
      ),
    );
  }
}
