import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';

import '../../resources/colors_const.dart';
import '../../resources/string_const.dart';
import '../../resources/values_const.dart';

class RestoScreen extends StatefulWidget {
  const RestoScreen({super.key});

  @override
  State<RestoScreen> createState() => _RestoScreenState();
}

class _RestoScreenState extends State<RestoScreen> {
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
                      Navigator.popAndPushNamed(context, Routes.homescreen);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    )),
                expandedHeight: AppSize.s350,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.all(10),
                      centerTitle: false,
                      expandedTitleScale: 1.2,
                      title: Text(
                        'Restaurant name',
                        textAlign: TextAlign.start,
                        style: UpdateUser.customTextStyle(FontSize.s20,
                            FontWeightManager.bold, ColorManager.white),
                      ),
                      background: const Image(
                        image: AssetImage(ImageAssets.resto),
                        fit: BoxFit.cover,
                      ),
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ClipRRect(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  color: ColorManager.theame100,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: ColorManager.theame300,
                                      width: AppSize.s2)),
                              child: Center(
                                  child: Text(
                                'Top rated',
                                style: UpdateUser.customTextStyle(
                                    FontSize.s12,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              ))),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          Icon(
                            Icons.circle_sharp,
                            color: ColorManager.green,
                            size: AppSize.s20,
                          ),
                          const SizedBox(
                            width: AppSize.s5,
                          ),
                          Text(
                            'Pure Veg',
                            style: UpdateUser.customTextStyle(
                                FontSize.s10,
                                FontWeightManager.medium,
                                ColorManager.graynish),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8),
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
                      ),
                    ),
                  ),
                ),
              ),

              /// Sliver APPbar 3
              SliverAppBar(
                elevation: AppSize.s0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: AppSize.s170,
                collapsedHeight: AppSize.s150,
                stretch: true,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// MainCourse field
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Starters
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.starters,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.s5,
                              ),
                              Text(
                                'Starters',
                                style: UpdateUser.customTextStyle(
                                    FontSize.s18,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),

                          /// MainMenu
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.resto,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.s5,
                              ),
                              Text(
                                'Main Menu',
                                style: UpdateUser.customTextStyle(
                                    FontSize.s18,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),

                          /// Desserts
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.height / 7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.desserts,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.s5,
                              ),
                              Text(
                                'Desserts',
                                style: UpdateUser.customTextStyle(
                                    FontSize.s18,
                                    FontWeightManager.medium,
                                    ColorManager.graynish),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        /// Row 1st
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Panner Tanduri',
                                  style: UpdateUser.customTextStyle(
                                      FontSize.s14,
                                      FontWeightManager.bold,
                                      ColorManager.black),
                                ),
                                Text(
                                  "56",
                                  style: UpdateUser.customTextStyle(
                                      FontSize.s14,
                                      FontWeightManager.medium,
                                      ColorManager.graynish),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: AppSize.s100,
                                  width: AppSize.s120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      image: AssetImage(
                                        ImageAssets.starters,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.paymentscreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: ColorManager.white),
                                    child: Text(
                                      'ADD',
                                      style:
                                          TextStyle(color: ColorManager.yellow),
                                    ))
                              ],
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Divider(
                            height: 0,
                            thickness: 0,
                            color: ColorManager.lightgray,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
