import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';

import '../../resources/colors_const.dart';
import '../../resources/controller/scroll_to_hide_widget.dart';
import '../../resources/route_manager.dart';
import '../../resources/string_const.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_const.dart';

class OrderScreen extends StatefulWidget {
  final String? restoname;
  final String? paymentmode;
  final String? couponcode;
  final List? foodname;
  final List? foodcost;
  const OrderScreen({super.key, this.paymentmode, this.couponcode, this.foodname, this.foodcost, this.restoname});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  // @override
  // void initState() {
  //   controller = ScrollController();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   controller = ScrollController();
  //   super.dispose();
  // }
  List? get foodnames => widget.foodname;
  List? get foodcosts => widget.foodcost;
  int Index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: Text(" "),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_outlined,color: ColorManager.white,size: AppSize.s30)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        title: Text(
          AppString.orders,
          style: UpdateUser.customTextStyle(
              MediaQuery.of(context).size.width / 15,
              FontWeightManager.medium,
              ColorManager.white),
        ),
        backgroundColor: ColorManager.theame100,
      ),
      body: Column(
        children: [
          widget.restoname.toString() == 'null' ? Expanded(child: Center(child: Image(image: AssetImage(ImageAssets.nodata),width: 50,),)) :
          Expanded(
              child: ListView.builder(
                 itemCount: 1,
                  itemBuilder: (BuildContext context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      // height: MediaQuery.of(context).size.height / 10,
                      // width: MediaQuery.of(context).size.width / 1,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      //decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.restoname.toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 20, FontWeightManager.medium, ColorManager.black),),
                              Divider(thickness: 1,color: ColorManager.gray,),
                              Row(
                                children: [
                                  Text(AppString.orderno,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.regular, ColorManager.black),),
                                  Text('1234567890',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.gray),)
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 50,),
                              Row(
                                children: [
                                  Text(AppString.couponno,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.regular, ColorManager.black),),
                                  Text(widget.couponcode == null ? '--' : widget.couponcode.toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.gray),)
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 40,),
                             SizedBox(
                               height: MediaQuery.of(context).size.height/10,
                               child: ListView.builder(itemCount:widget.foodname?.length,itemBuilder: (context,index){
                                 return Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(foodnames![index].toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                                     Text(foodcosts![index].toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.bold, ColorManager.black),)
                                   ],
                                 );
                               }),
                             ) ,

                              SizedBox(height: MediaQuery.of(context).size.height / 60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(AppString.total,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                                  SizedBox(width: MediaQuery.of(context).size.width / 40,),
                                  Text(widget.foodcost.toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.bold, ColorManager.black),)
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 40,),
                              Row(
                                children: [
                                  Text(AppString.paymentmode,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.regular, ColorManager.black),),
                                  Text(widget.paymentmode.toString(),style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.gray),)
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }


}
