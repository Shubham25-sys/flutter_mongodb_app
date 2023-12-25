import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class MyProviders extends ChangeNotifier {
  final databaseRef = FirebaseDatabase.instance.ref();

}
