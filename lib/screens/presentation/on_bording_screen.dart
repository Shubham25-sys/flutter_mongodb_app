import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/screens/presentation/homescreen.dart';
import 'package:flutter_mongodb_app/screens/presentation/orders_screen.dart';
import 'package:flutter_mongodb_app/screens/presentation/profile_screen.dart';
import '../../resources/colors_const.dart';
import '../../resources/values_const.dart';

class OnBordingScreen extends StatefulWidget {
  final String? email;
  final String? username;
  OnBordingScreen({super.key, this.email, this.username});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screen = [
      HomeScreen(
        email: widget.email.toString(),
        username: widget.username.toString(),
      ),
      const OrderScreen(),
      ProfileScreen(
        email: widget.email.toString(),
        username: widget.username.toString(),
      )
    ];
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: bottomnavigationbar,
    );
  }

  Widget get bottomnavigationbar {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0), topRight: Radius.circular(0)),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: ColorManager.white,
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: ColorManager.theame100,
          selectedIndex: index,
          onDestinationSelected: (Index) => setState(() => index = Index),
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: ColorManager.black,
                  size: AppSize.s30,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  color: ColorManager.black,
                  size: AppSize.s30,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: ColorManager.black,
                  size: AppSize.s30,
                ),
                selectedIcon: Icon(
                  Icons.notifications,
                  color: ColorManager.black,
                  size: AppSize.s30,
                ),
                label: 'Orders'),
            NavigationDestination(
                icon: Icon(
                  Icons.perm_identity_outlined,
                  size: AppSize.s30,
                  color: ColorManager.black,
                ),
                selectedIcon: Icon(
                  Icons.person,
                  color: ColorManager.black,
                  size: AppSize.s30,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
