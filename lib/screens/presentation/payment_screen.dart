import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Payment screen under development..',
          style: UpdateUser.customTextStyle(
              FontSize.s20, FontWeightManager.medium, ColorManager.gray),
        ),
      ),
    );
  }
}
