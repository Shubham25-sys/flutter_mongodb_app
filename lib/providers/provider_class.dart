import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mongodb_app/screens/presentation/list.dart';


class MyProviders extends ChangeNotifier {
 //final getlist = Resources.starters.toList();
  String _username = '';
  String get _getusername => _username;
  List<String> _foodname = [];
  List<String> _foodcost = [];
  List<String> get getfoodname => _foodname;
  List<String> get getfoodcost => _foodcost;

  //
  // int calculateSelectedSum() {
  //   return getfoodcost.fold(0, (sum, item) => getfoodcost.isSelected ? sum + item.value : sum);
  // }

  void passusername(String newvalue){
    _username = newvalue;
    notifyListeners();
  }
  void selectedItems(String name,String cost){
   final isExist = _foodname.contains(name);
   final isExistcost = _foodcost.contains(cost);

   if(isExist && isExistcost){
     _foodname.remove(name);
     _foodcost.remove(cost);
   }else{
     _foodname.add(name);
     _foodcost.add(cost);
   }
   notifyListeners();
  }

  void clearAll(){
    _foodname = [];
    _foodcost = [];
   notifyListeners();
  }


}
