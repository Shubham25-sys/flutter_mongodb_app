import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:flutter_mongodb_app/screens/presentation/registredscreen.dart';
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.restoscreen,
      theme: getApplicationTheme(),
    );
  }
}



