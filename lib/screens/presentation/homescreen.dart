import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/controller/navigationdrawer.dart';
import 'package:flutter_mongodb_app/resources/controller/scroll_to_hide_widget.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:flutter_mongodb_app/screens/pages/page1.dart';
import 'package:flutter_mongodb_app/screens/pages/page2.dart';
import 'package:flutter_mongodb_app/screens/presentation/restaurant_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../resources/string_const.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  final String username;
  HomeScreen({super.key, required this.email, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
    'Item 6',
  ];
  int tappedIndex = -1;
  late ScrollController controller;
  final _controller = PageController();
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller = ScrollController();
    super.dispose();
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  final ref = FirebaseDatabase.instance
      .ref()
      .child('RestoDetails')
      .child('ListRegister');
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_outlined,color: ColorManager.white,size: AppSize.s30)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
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
        backgroundColor: ColorManager.theame100,
      ),
      drawer: Navigationdrawer(
        email: widget.email,
        username: widget.username,
      ),
      body: RefreshIndicator(
        edgeOffset: 0,
        onRefresh: _refresh,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1,
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      controller: _controller,
                      children: const [Page1(), Page2()],
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: ExpandingDotsEffect(
                          dotColor: ColorManager.faintgray,
                          activeDotColor: ColorManager.theame100,
                          dotHeight: AppSize.s5,
                          dotWidth: AppSize.s5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                          color: ColorManager.light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: ColorManager.theame200,
                              width: AppSize.s2)),
                      child: Center(
                        child: Text(
                          AppString.items,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: FirebaseAnimatedList(
                          query: ref,
                          // controller: controller,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, snapshot, animation, index) {
                            Map restodetails = snapshot.value as Map;
                            restodetails['key'] = snapshot.key;
                            final item = snapshot
                                .child(
                                'restaurant_name')
                                .value
                                .toString();
                            return Slidable(
                              endActionPane: ActionPane(
                                dragDismissible: true,
                                extentRatio: 0.5,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => {},
                                    icon: check == null
                                        ? Icons.favorite_border_outlined
                                        : Icons.favorite,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => {},
                                    icon: Icons.menu,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => {},
                                    icon: Icons.remove_red_eye_outlined,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  //heroTag:'name',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => RestoScreen(
                                                  restoname: snapshot
                                                      .child('restaurant_name')
                                                      .value
                                                      .toString(),
                                                  type: snapshot
                                                      .child('type')
                                                      .value
                                                      .toString(),
                                                  image: restodetails[
                                                          'restaurantimage']
                                                      .toString(),
                                                )));
                                  },
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: MediaQuery.of(context).size.width,
                                    child: Material(
                                      elevation: 4,
                                      borderRadius: BorderRadius.circular(10),
                                      child: ClipRRect(
                                        //borderRadius: BorderRadius.circular(10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    restodetails[
                                                            'restaurantimage']
                                                        .toString(),
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SingleChildScrollView(
                                                  child: ScrollConfiguration(
                                                    behavior:
                                                        ScrollConfiguration.of(
                                                                context)
                                                            .copyWith(
                                                                scrollbars:
                                                                    false),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .child(
                                                                  'restaurant_name')
                                                              .value
                                                              .toString(),
                                                          style: UpdateUser
                                                              .customTextStyle(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      15,
                                                                  FontWeightManager
                                                                      .semiBold,
                                                                  ColorManager
                                                                      .black),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .child(
                                                                  'restaurant_address')
                                                              .value
                                                              .toString(),
                                                          style: UpdateUser
                                                              .customTextStyle(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30,
                                                                  FontWeightManager
                                                                      .regular,
                                                                  ColorManager
                                                                      .gray),
                                                        ),
                                                        const SizedBox(
                                                          height: AppSize.s10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  ColorManager
                                                                      .yellow,
                                                              size: AppSize.s20,
                                                            ),
                                                            const SizedBox(
                                                              width: AppSize.s5,
                                                            ),
                                                            Text(
                                                              '4.2',
                                                              style: UpdateUser.customTextStyle(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30,
                                                                  FontWeightManager
                                                                      .regular,
                                                                  ColorManager
                                                                      .gray),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: AppSize.s5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            snapshot
                                                                        .child(
                                                                            'type')
                                                                        .value ==
                                                                    'Pure Veg'
                                                                        .toString()
                                                                ? Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: ColorManager
                                                                        .green,
                                                                    size: AppSize
                                                                        .s15,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color:
                                                                        ColorManager
                                                                            .red,
                                                                    size: AppSize
                                                                        .s15,
                                                                  ),
                                                            const SizedBox(
                                                              width: AppSize.s5,
                                                            ),
                                                            Text(snapshot
                                                                .child('type')
                                                                .value
                                                                .toString())
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
      //bottomNavigationBar: bottomnavigationbar,
    );
  }

  // Widget get bottomnavigationbar {
  //   return AnimatedBuilder(
  //     animation: controller,
  //     builder: (BuildContext context, Widget? child) {
  //       return AnimatedContainer(
  //         height:
  //             controller.position.userScrollDirection == ScrollDirection.reverse
  //                 ? AppSize.s0
  //                 : AppSize.s60,
  //         duration: const Duration(milliseconds: 300),
  //         child: child,
  //       );
  //     },
  //     child: ClipRRect(
  //       borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(0), topRight: Radius.circular(0)),
  //       child: ScrollToHideWidget(
  //         controller: controller,
  //         child: BottomNavigationBar(
  //           backgroundColor: ColorManager.theame100,
  //           items: [
  //             BottomNavigationBarItem(
  //                 icon: IconButton(
  //                    onPressed: () {
  //                    }, icon: Icon(Icons.home_outlined,color: ColorManager.black,size: AppSize.s30,),
  //                 ),
  //                 label: ''),
  //             BottomNavigationBarItem(
  //                 icon: IconButton(
  //                   onPressed: () {
  //                     Navigator.pushNamed(context, Routes.orderscreen);
  //                   },
  //                   icon: Icon(
  //                     Icons.notifications_none_outlined,
  //                     color: ColorManager.black,
  //                     size: AppSize.s30,
  //                   ),
  //                 ),
  //                 label: ''),
  //             BottomNavigationBarItem(
  //                 icon: IconButton(
  //                   onPressed: () {
  //                     Navigator.pushNamed(context, Routes.profilescreen);
  //                   },
  //                   icon: Icon(
  //                     Icons.perm_identity_outlined,
  //                     size: AppSize.s30,
  //                     color: ColorManager.black,
  //                   ),
  //                 ),
  //                 label: ''),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
