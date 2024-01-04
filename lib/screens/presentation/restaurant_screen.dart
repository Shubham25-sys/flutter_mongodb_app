import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/screens/presentation/list.dart';
import 'package:flutter_mongodb_app/screens/presentation/payment_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../resources/colors_const.dart';
import '../../resources/string_const.dart';
import '../../resources/values_const.dart';

class RestoScreen extends StatefulWidget {
  final String restoname;
  final String type;
  final String image;
  final String location;
  final String? email;
  final String? username;
  RestoScreen(
      {super.key,
      required this.restoname,
      required this.type,
      required this.image, required this.location, this.email, this.username});

  @override
  State<RestoScreen> createState() => _RestoScreenState();
}

class _RestoScreenState extends State<RestoScreen> {
  bool _customeicon = false;
  bool _isSelected = false;

  // List Items = ['Starters', 'Main Menu', 'Deserts', 'Soupe', 'Rice'];
  List<String> templist =[];
  List<String> templist1 =[];
  List<String> templist2 =[];
  List<String> templist3 =[];
  List<String> mainlist =[];
  Future<void> getList()async {

  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProviders>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: AppSize.s20,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  style: TextStyle(color: ColorManager.black),
                  cursorColor: ColorManager.black,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: ColorManager.theame200,
                        size: AppSize.s30,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.only(bottom: 10, right: 5),
                      hintText: AppString.search,
                      hintStyle: TextStyle(color: ColorManager.gray)),
                  //readOnly: true,
                  onTap: () {},
                ),
              ),
            ),
          )
        ],
      ),
          body:Stack(
            children: [
              ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                       Align(
                         alignment: Alignment.topLeft,
                         child: Text(
                          widget.restoname,
                          textAlign: TextAlign.start,
                          style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15,
                              FontWeightManager.bold, ColorManager.black),
                      ),
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              widget.type == 'Pure Veg'
                                  ? Icon(
                                Icons.circle_sharp,
                                color: ColorManager.green,
                                size: MediaQuery.of(context).size.width/25,
                              )
                                  : Icon(
                                Icons.circle_sharp,
                                color: ColorManager.red,
                                size: MediaQuery.of(context).size.width/25,
                              ),
                              const SizedBox(
                                width: AppSize.s5,
                              ),
                              Text(
                                widget.type,
                                style: UpdateUser.customTextStyle(
                                    MediaQuery.of(context).size.width/30,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                AppString.ratting,
                                style: UpdateUser.customTextStyle(
                                    MediaQuery.of(context).size.width/30,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              ),
                              const SizedBox(
                                width: AppSize.s5,
                              ),
                              Container(
                                  height: AppSize.s20,
                                  width: AppSize.s30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: ColorManager.graynish, width: 1)),
                                  child: Center(
                                      child: Text('4.1',
                                          style: UpdateUser.customTextStyle(
                                              FontSize.s10,
                                              FontWeightManager.bold,
                                              ColorManager.black)))),
                            ],
                          ),
                        ],
                      ),
                      Align(alignment: Alignment.topLeft,child: Text(widget.location,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/25, FontWeightManager.semiBold, ColorManager.gray),)),
                      SizedBox(height: MediaQuery.of(context).size.height/15,),
                      Container(
                        decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(20)),
                        child: ExpansionTile(title: Text('Soups',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15, FontWeightManager.bold, ColorManager.black),),
                          trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                          initiallyExpanded: true,
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          onExpansionChanged: (bool expanded){
                            setState(()=> _customeicon = expanded);
                          },
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/2,
                              width: double.infinity,
                              child: ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(color: ColorManager.faintgray,);},
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: Resources.soupsveg.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(Resources.soupsveg[index]['foodname'].toString(),style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 20,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 50,),
                                              Text('\u{20B9}${Resources.soupsveg[index]['cost']}',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 25,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 15,),
                                              Text('Loream xyc asdas sadwenubf,a sdasdas',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 30,
                                                  FontWeightManager.regular,
                                                  ColorManager.gray),),

                                            ],
                                          ),
                                          Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height / 8,
                                                  width: MediaQuery.of(context).size.width / 4,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image(image: AssetImage(Resources.soupsveg[index]['imageurl']),fit: BoxFit.cover,),
                                                  ),
                                                ),
                                                ElevatedButton(onPressed:(){
                                                  setState(() {
                                                    if(templist.contains(Resources.soupsveg[index]['foodname'].toString())){
                                                      templist.remove(Resources.soupsveg[index]['foodname'].toString());
                                                    }else{
                                                      templist.add(Resources.soupsveg[index]['foodname'].toString());
                                                    }
                                                  });
                                                  print(templist.toString());
                                                  provider.selectedItems(Resources.soupsveg[index]['foodname'].toString(), Resources.soupsveg[index]['cost'].toString());
                                                },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: const StadiumBorder(),
                                                        backgroundColor: templist.contains(Resources.soupsveg[index]['foodname'].toString()) ? ColorManager.faintgray : ColorManager.white),
                                                    child: Text(templist.contains(Resources.soupsveg[index]['foodname'].toString()) ? 'Remove' : 'Add',style: TextStyle(color: templist.contains(Resources.soupsveg[index]['foodname'].toString())?ColorManager.white:ColorManager.yellow),))])],
                                      ),
                                    );
                                  }),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15,),
                      Container(
                        decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(20)),
                        child: ExpansionTile(title: Text('Starters',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15, FontWeightManager.bold, ColorManager.black),),
                          trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                          initiallyExpanded: true,
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          onExpansionChanged: (bool expanded){
                            setState(()=> _customeicon = expanded);
                          },
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/2,
                              width: double.infinity,
                              child: ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(color: ColorManager.faintgray,);},
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: Resources.startersveg.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(Resources.startersveg[index]['foodname'].toString(),style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 20,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 50,),
                                              Text('\u{20B9}${Resources.startersveg[index]['cost'].toString()}',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 25,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 15,),
                                              Text('Loream xyc asdas sadwenubf,a sdasdas',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 30,
                                                  FontWeightManager.regular,
                                                  ColorManager.gray),),

                                            ],
                                          ),
                                          Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height / 8,
                                                  width: MediaQuery.of(context).size.width / 4,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image(image: AssetImage(Resources.startersveg[index]['imageurl']),fit: BoxFit.cover,),
                                                  ),
                                                ),
                                                ElevatedButton(onPressed: (){
                                                  setState(() {
                                                    if(templist1.contains(Resources.startersveg[index]['foodname'].toString())){
                                                      templist1.remove(Resources.startersveg[index]['foodname'].toString());
                                                    }else{
                                                      templist1.add(Resources.startersveg[index]['foodname'].toString());
                                                    }
                                                  });
                                                  provider.selectedItems(Resources.startersveg[index]['foodname'].toString(), Resources.startersveg[index]['cost'].toString());
                                                },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: const StadiumBorder(),
                                                        backgroundColor: templist1.contains(Resources.startersveg[index]['foodname'].toString()) ? ColorManager.faintgray : ColorManager.white),
                                                    child: Text(templist1.contains(Resources.startersveg[index]['foodname'].toString()) ? 'Remove' : 'Add',style: TextStyle(color: templist1.contains(Resources.startersveg[index]['foodname'].toString()) ? ColorManager.white:ColorManager.yellow),))])],
                                      ),
                                    );
                                  }),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15,),
                      Container(
                        decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(20)),
                        child: ExpansionTile(title: Text('Main Menu',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15, FontWeightManager.bold, ColorManager.black),),
                          trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          initiallyExpanded: true,
                          onExpansionChanged: (bool expanded){
                            setState(()=> _customeicon = expanded);
                          },
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/2,
                              width: double.infinity,
                              child: ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(color: ColorManager.faintgray,);},
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: Resources.mainmenuveg.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(Resources.mainmenuveg[index]['foodname'].toString(),style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 20,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 50,),
                                              Text('\u{20B9}${Resources.mainmenuveg[index]['cost']}',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 25,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 15,),
                                              Text('Loream xyc asdas sadwenubf,a sdasdas',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 30,
                                                  FontWeightManager.regular,
                                                  ColorManager.gray),),

                                            ],
                                          ),
                                          Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height / 8,
                                                  width: MediaQuery.of(context).size.width / 4,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image(image: AssetImage(Resources.mainmenuveg[index]['imageurl']),fit: BoxFit.cover,),
                                                  ),
                                                ),
                                                ElevatedButton(onPressed: (){
                                                  setState(() {
                                                    if(templist2.contains(Resources.mainmenuveg[index]['foodname'].toString())){
                                                      templist2.remove(Resources.mainmenuveg[index]['foodname'].toString());
                                                    }else{
                                                      templist2.add(Resources.mainmenuveg[index]['foodname'].toString());
                                                    }
                                                  });
                                                  provider.selectedItems(Resources.mainmenuveg[index]['foodname'].toString(), Resources.desertsveg[index]['cost'].toString());
                                                },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: const StadiumBorder(),
                                                        backgroundColor: templist2.contains(Resources.mainmenuveg[index]['foodname'].toString()) ? ColorManager.faintgray : ColorManager.white),
                                                    child: Text(templist2.contains(Resources.mainmenuveg[index]['foodname'].toString()) ? 'Remove' : 'Add',style: TextStyle(color: templist2.contains(Resources.mainmenuveg[index]['foodname'].toString())?ColorManager.white:ColorManager.yellow),))])],
                                      ),
                                    );
                                  }),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15,),
                      Container(
                        decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(20)),
                        child: ExpansionTile(title: Text('Deserts',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15, FontWeightManager.bold, ColorManager.black),),
                          trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          initiallyExpanded: true,
                          onExpansionChanged: (bool expanded){
                            setState(()=> _customeicon = expanded);
                          },
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/2,
                              width: double.infinity,
                              child: ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(color: ColorManager.faintgray,);},
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: Resources.desertsveg.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(Resources.desertsveg[index]['foodname'].toString(),style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 20,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 50,),
                                              Text('\u{20B9}${Resources.desertsveg[index]['cost']}',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 25,
                                                  FontWeightManager.bold,
                                                  ColorManager.black),),
                                              SizedBox(height: MediaQuery.of(context).size.height / 15,),
                                              Text('Loream xyc asdas sadwenubf,a sdasdas',style: UpdateUser.customTextStyle(
                                                  MediaQuery.of(context).size.width / 30,
                                                  FontWeightManager.regular,
                                                  ColorManager.gray),),

                                            ],
                                          ),
                                          Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height / 8,
                                                  width: MediaQuery.of(context).size.width / 4,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image(image: AssetImage(Resources.desertsveg[index]['imageurl']),fit: BoxFit.cover,),
                                                  ),
                                                ),
                                                ElevatedButton(onPressed: (){
                                                  setState(() {
                                                    if(templist3.contains(Resources.desertsveg[index]['foodname'].toString())){
                                                      templist3.remove(Resources.desertsveg[index]['foodname'].toString());
                                                    }else{
                                                      templist3.add(Resources.desertsveg[index]['foodname'].toString());
                                                    }
                                                  });
                                                  provider.selectedItems(Resources.desertsveg[index]['foodname'].toString(), Resources.desertsveg[index]['cost'].toString());
                                                },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: const StadiumBorder(),
                                                        backgroundColor: templist3.contains(Resources.desertsveg[index]['foodname'].toString()) ? ColorManager.faintgray : ColorManager.white),
                                                    child: Text(templist3.contains(Resources.desertsveg[index]['foodname'].toString()) ? 'Remove' : 'Add',style: TextStyle(color: templist3.contains(Resources.desertsveg[index]['foodname'].toString()) ? ColorManager.white:ColorManager.yellow),))])],
                                      ),
                                    );
                                  }),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                ]
            ),
               Positioned(right: MediaQuery.of(context).size.width/1.6,
                  top: MediaQuery.of(context).size.height/1.3,
                  child: SizedBox(height: MediaQuery.of(context).size.height/17,
                    width: MediaQuery.of(context).size.width/3,
                  child: (templist.isNotEmpty) || (templist1.isNotEmpty) || (templist2.isNotEmpty) || (templist3.isNotEmpty) ? ElevatedButton(onPressed: () {
                     setState(() {
                      mainlist.addAllT(templist,);
                      mainlist.addAllT(templist1,);
                      mainlist.addAllT(templist2,);
                      mainlist.addAllT(templist3,);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> PaymentScreen(email: widget.email.toString(),username:widget.username.toString(),temp: mainlist,restoname: widget.restoname,)));
                  }, style:ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: ColorManager.theame300),child: Text('NEXT'),):null))]
          )

    );
  }
}
