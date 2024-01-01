import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/on_bording_screen.dart';
import 'package:flutter_mongodb_app/services/notification_services.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../providers/provider_class.dart';
import 'popups/couponcode_popup.dart';

class PaymentScreen extends StatefulWidget {
   List? temp;
   final String? restoname;
   final String? email;
   final String? username;
   PaymentScreen({super.key,  this.temp, this.restoname, this.email, this.username});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? ValueChoose;
  List PaymentList = ['Upi-Payment', 'Cash', 'PhonePay', 'GPay'];

  Future<void> ShowAleart()async {

  }

  void popup(){
    setState(() {
      showDialog(context: context, builder: (BuildContext context)=>const CouponCodePopup());
    });
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProviders>(context);
    final foodname = provider.getfoodname;
    final foodcost = provider.getfoodcost;
    return Scaffold(
        backgroundColor: ColorManager.whitesheed2,
        appBar: AppBar(

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          backgroundColor: ColorManager.theame100,
          title: const Text('Payment'),

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Restaurent name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Restaurant name',
                    style: UpdateUser.customTextStyle(FontSize.s25,
                        FontWeightManager.medium, ColorManager.graynish),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 1,
                          child: ListView.builder(
                              itemCount: foodname.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(foodname[index],
                                        style: UpdateUser.customTextStyle(
                                            FontSize.s14,
                                            FontWeightManager.regular,
                                            ColorManager.graynish)),
                                    Text('\u{20B9}${foodcost[index]}',
                                        style: UpdateUser.customTextStyle(
                                            FontSize.s14,
                                            FontWeightManager.regular,
                                            ColorManager.graynish)),
                                    IconButton(onPressed: (){
                                      provider.clearAll();
                                    }, icon: Icon( Icons.delete_outlined,
                                      color: ColorManager.whitesheed,))
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                    Divider(
                      height: AppSize.s0,
                      color: ColorManager.dividercolor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Add More Items',
                              style: UpdateUser.customTextStyle(
                                  FontSize.s14,
                                  FontWeightManager.regular,
                                  ColorManager.graynish)),
                          IconButton(
                            color: ColorManager.whitesheed, onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.add_box_outlined,),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),

                /// Offers
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Offers & Benefites',
                    style: UpdateUser.customTextStyle(FontSize.s14,
                        FontWeightManager.regular, ColorManager.black),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: (){popup();},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apply',
                            style: UpdateUser.customTextStyle(FontSize.s14,
                                FontWeightManager.medium, ColorManager.black),
                          ),
                          Icon(Icons.local_offer_outlined,
                              color: ColorManager.whitesheed)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),

                /// Payment
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Payment Details',
                    style: UpdateUser.customTextStyle(FontSize.s14,
                        FontWeightManager.regular, ColorManager.black),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 1,
                          child: ListView.builder(
                              itemCount: foodname.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(foodname[index],
                                              style: UpdateUser.customTextStyle(
                                                  FontSize.s14,
                                                  FontWeightManager.regular,
                                                  ColorManager.graynish)),
                                          Text('\u{20B9}${foodcost[index]}',
                                              style: UpdateUser.customTextStyle(
                                                  FontSize.s14,
                                                  FontWeightManager.regular,
                                                  ColorManager.graynish)),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Divider(
                          height: AppSize.s0,
                          color: ColorManager.dividercolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL',
                                  style: UpdateUser.customTextStyle(
                                      FontSize.s14,
                                      FontWeightManager.regular,
                                      ColorManager.graynish)),
                              Text('\u{20B9}57',
                                  style: UpdateUser.customTextStyle(
                                      FontSize.s14,
                                      FontWeightManager.regular,
                                      ColorManager.graynish)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Place order
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                        //color: ColorManager.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: AppSize.s1,
                                            color: ColorManager.graynish)),
                                    child: DropdownButton(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p10),
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      icon: const Icon(
                                          Icons.arrow_drop_down_outlined),
                                      iconSize: AppSize.s40,
                                      elevation: 1,
                                      borderRadius: BorderRadius.circular(10),
                                      value: ValueChoose,
                                      hint: const Text('Select Payment'),
                                      onChanged: (newval) {
                                        setState(() {
                                          ValueChoose = newval.toString();
                                        });
                                      },
                                      items: PaymentList.map((ValueItems) {
                                        return DropdownMenuItem(
                                            value: ValueItems,
                                            child: Text(
                                              ValueItems,
                                              style: UpdateUser.customTextStyle(
                                                  FontSize.s14,
                                                  FontWeightManager.regular,
                                                  ColorManager.black),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                  Text(
                                    '\u{20B9}57',
                                    style: UpdateUser.customTextStyle(
                                        FontSize.s14,
                                        FontWeightManager.regular,
                                        ColorManager.graynish),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    onPressed: () async{
                                      await QuickAlert.show(context: context, type: QuickAlertType.success,autoCloseDuration: Duration(seconds: 5));
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBordingScreen(email:widget.email.toString(),username:widget.username.toString(),foodname: foodname.toList(),foodcost: foodcost.toList(),paymentmode: ValueChoose.toString(),restoname: widget.restoname.toString(),)));
                                      await NotificationServices.showNotification(title: 'Order Placed', body:'Enjoy your food');
                                      provider.clearAll();
                                      ShowAleart();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: ColorManager.greennish),
                                    child: Text(
                                      AppString.placeorder,
                                      style: UpdateUser.customTextStyle(
                                          FontSize.s14,
                                          FontWeightManager.bold,
                                          ColorManager.black),
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
