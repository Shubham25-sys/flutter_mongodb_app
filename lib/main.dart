import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/services/notification_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationServices.initializeNotification();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyC8wWSuJ9Ilnvk6t6qMhgbNWFxGmdlz6j4",
              appId: "1:450913635291:android:51a4bf75349d6fe95875fe",
              messagingSenderId: "450913635291",
              projectId: "flutter-mongo-db",
              storageBucket: "flutter-mongo-db.appspot.com"))
      : await Firebase.initializeApp();

  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDataBase.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>MyProviders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashscreen,
        theme: getApplicationTheme(),
      ),
    );
  }
}
