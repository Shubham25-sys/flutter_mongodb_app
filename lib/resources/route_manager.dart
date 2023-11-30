import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/payment_screen.dart';

import '../screens/presentation/homescreen.dart';
import '../screens/presentation/loginscreen.dart';
import '../screens/presentation/registredscreen.dart';
import '../screens/presentation/restaurant_screen.dart';

class Routes{
  static const String registredscreen = "/";
  static const String homescreen = "HomeScreen";
  static const String loginscreen = "LoginScreen";
  static const String restoscreen = "RestoScreen";
  static const String paymentscreen = "PaymentScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.registredscreen:
        return MaterialPageRoute(builder: (_) => const RegisteredScreen());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.restoscreen:
        return MaterialPageRoute(builder: (_) => const RestoScreen());
      case Routes.paymentscreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());


      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppString.notFoundRoute),
          ),
          body: const Center(
            child: Text(AppString.notFoundRoute),
          ),
        ));
  }
}