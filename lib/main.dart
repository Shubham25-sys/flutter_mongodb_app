import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:flutter_mongodb_app/screens/registredscreen.dart';
import 'package:provider/provider.dart';

import 'constant/mongodb.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDataBase.connect();
  runApp(ChangeNotifierProvider(
      create: (_) => MyProviders(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.loginscreen,
      theme: ThemeData(
        textTheme:  TextTheme(
          headline1: TextStyle(
            fontSize: FontSize.s40,
            color: ColorManager.theame200,
            fontWeight: FontWeightManager.regular
          ),
            headline2: TextStyle(
               // fontSize: FontSize.s40,
                color: ColorManager.theame200,
                fontWeight: FontWeightManager.regular
            ),
          bodyText1:  TextStyle(
            fontSize: FontSize.s18,
            fontWeight: FontWeightManager.medium,
            color: ColorManager.theame300,
          ),
          headline3:  TextStyle(
           // fontSize: FontSize.s14,
            fontWeight: FontWeightManager.medium,
            color: ColorManager.theame300,
          ),
          bodyText2: TextStyle(
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.semiBold,
            color: ColorManager.theame300
          ),
          labelMedium: TextStyle(
              fontSize: FontSize.s14,
            color: ColorManager.gray,
            fontWeight: FontWeightManager.medium,
          )

        )
      ),
      home: const RegisteredScreen() ,
    );
  }
}



