import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/screens/presentation/list.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/colors_const.dart';
import '../../resources/string_const.dart';
import '../../resources/values_const.dart';

class RestoScreen extends StatefulWidget {
  final String restoname;
  final String type;
  final String image;
  RestoScreen(
      {super.key,
      required this.restoname,
      required this.type,
      required this.image});

  @override
  State<RestoScreen> createState() => _RestoScreenState();
}

class _RestoScreenState extends State<RestoScreen> {
  bool _customeicon = false;

  // List Items = ['Starters', 'Main Menu', 'Deserts', 'Soupe', 'Rice'];
  // List Items1 = ['Panner', 'Tikka'];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
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
                elevation: AppSize.s0,
                surfaceTintColor: ColorManager.theame200,
                foregroundColor: ColorManager.theame100,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    )),
                expandedHeight: AppSize.s350,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p50,
                      left: AppPadding.p5,
                      right: AppPadding.p5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.all(10),
                      centerTitle: false,
                      expandedTitleScale: 1.2,
                      title: Text(
                        widget.restoname,
                        textAlign: TextAlign.start,
                        style: UpdateUser.customTextStyle(FontSize.s20,
                            FontWeightManager.bold, ColorManager.white),
                      ),
                      background: Padding(
                          padding: EdgeInsets.only(top: AppPadding.p40),
                          child: Image.network(
                            widget.image.toString(),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ),
              ),

              /// Sliver App bar 2
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                pinned: false,
                elevation: AppSize.s0,
                expandedHeight: AppSize.s0,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          widget.type == 'Pure Veg'
                              ? Icon(
                                  Icons.circle_sharp,
                                  color: ColorManager.green,
                                  size: AppSize.s20,
                                )
                              : Icon(
                                  Icons.circle_sharp,
                                  color: ColorManager.red,
                                  size: AppSize.s20,
                                ),
                          const SizedBox(
                            width: AppSize.s5,
                          ),
                          Text(
                            widget.type,
                            style: UpdateUser.customTextStyle(
                                FontSize.s10,
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
                                FontSize.s10,
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
                      )
                    ],
                  ),
                ),
              ),


            ];
          },
          body:ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: ColorManager.cardcolor,borderRadius: BorderRadius.circular(20)),
                    child: ExpansionTile(title: Text('Starters',style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/20, FontWeightManager.bold, ColorManager.black),),
                      trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2,
                        width: double.infinity,
                        child: ListView.builder(
                          //scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Resources.maplist.length,
                            itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(Resources.maplist[index]['foodname'].toString()),
                                      Text(Resources.maplist[index]['cost'].toString())
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 10,
                                        width: MediaQuery.of(context).size.width / 9,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(image: AssetImage(Resources.maplist[index]['imageurl']),fit: BoxFit.cover,),
                                        ),
                                      ),

                                    ],
                                  ),


                                ],
                              ),
                            );

                        }),
                      )
                    ],
                    onExpansionChanged: (bool expanded){
                      setState(()=> _customeicon = expanded);
                    },),
                  ),
                  SizedBox(height: 30,),
                  ExpansionTile(title: Text('Starters'),
                    trailing: Icon(_customeicon ?Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_outlined),
                    children: [
                      SizedBox(
                        height: 200,
                        width: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: Resources.maplist.length,
                            itemBuilder: (context, index){
                              return Container(child: Text(Resources.maplist[index]['foodname'].toString()));

                            }),
                      )
                    ],
                    onExpansionChanged: (bool expanded){
                      setState(()=> _customeicon = expanded);
                    },)
                ],
            ),
              ),]
          )
      ),
    );
  }
}
