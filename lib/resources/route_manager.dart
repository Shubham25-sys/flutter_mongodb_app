import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/on_bording_screen.dart';
import 'package:flutter_mongodb_app/screens/presentation/payment_screen.dart';
import 'package:flutter_mongodb_app/screens/presentation/splash_screen.dart';
import '../admin_panel/presentation/add_restaurant_details.dart';
import '../screens/presentation/homescreen.dart';
import '../screens/presentation/loginscreen.dart';
import '../screens/presentation/orders_screen.dart';
import '../screens/presentation/profile_screen.dart';
import '../screens/presentation/registredscreen.dart';
import '../screens/presentation/restaurant_screen.dart';

class Routes{
  static const String splashscreen = "SplashScreen";
  static const String registredscreen = "/";
  static const String homescreen = "HomeScreen";
  static const String loginscreen = "LoginScreen";
  static const String restoscreen = "RestoScreen";
  static const String paymentscreen = "PaymentScreen";
  static const String profilescreen = "ProfileScreen";
  static const String orderscreen = "OrderScreen";
  static const String onbordingscreen = "OnBordingScreen";

  /// admin panel routes
  static const String adminpanelscreen = "AdminRestaurantDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registredscreen:
        return MaterialPageRoute(builder: (_) => const RegisteredScreen());
      // case Routes.homescreen:
      //   return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.restoscreen:
        return MaterialPageRoute(builder: (_) => const RestoScreen());
      case Routes.paymentscreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      // case Routes.profilescreen:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case Routes.orderscreen:
      //   return MaterialPageRoute(builder: (_) => const OrderScreen());
      case Routes.onbordingscreen:
        return MaterialPageRoute(builder: (_) =>  OnBordingScreen());

        /// Admin Panael routes
      case Routes.adminpanelscreen:
        return MaterialPageRoute(builder: (_) => const AdminRestaurantDetails());


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