import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import '../../../resources/colors_const.dart';
import '../../../resources/string_const.dart';

class CouponCodePopup extends StatelessWidget {
  const CouponCodePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                      color: ColorManager.graybg,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      cursorColor: ColorManager.black,
                      keyboardType: TextInputType.text,
                      style: UpdateUser.customTextStyle(FontSize.s14,
                          FontWeightManager.medium, ColorManager.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.local_offer_outlined,
                            color: ColorManager.gray,
                          ),
                          hintText: AppString.couponcode),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s40,
                width: AppSize.s100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: ColorManager.orangelight),
                  child: Text(AppString.apply,style: UpdateUser.customTextStyle(FontSize.s20, FontWeightManager.semiBold, ColorManager.black),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
