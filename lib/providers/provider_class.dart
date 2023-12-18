import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class MyProviders extends ChangeNotifier {
  final databaseRef = FirebaseDatabase.instance.ref();
  Future<void> AddRestaurantData(String restarantname, String restarantaddress,
      String rastaurantownername, String type, String foodlicenseno,String imagerurl) async {
    await databaseRef.child('RestoDetails').child('ListRegister').push().set({
      'restaurant_name': restarantname,
      'foodlicense_no': foodlicenseno,
      'restaurant_address': restarantaddress,
      'restaurant_owner_name': rastaurantownername,
      'restaurantimage': imagerurl,
    });
  }
}
