import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';

import '../screens/homescreen.dart';
import '../screens/loginscreen.dart';
import '../screens/registredscreen.dart';

class Routes{
  static const String registredscreen = "/";
  static const String homescreen = "HomeScreen";
  static const String loginscreen = "LoginScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.registredscreen:
        return MaterialPageRoute(builder: (_) => const RegisteredScreen());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());


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