import 'dart:developer';

import 'package:flutter_mongodb_app/constant/constant.dart';
// import 'package:mongo_dart/mongo_dart.dart';

// class MongoDataBase{
//   static connect() async {
//     var db = await Db.create(MONGO_URL);
//     await db.open();
//     var status = db.serverStatus();
//     print(status);
//     inspect(db);
//     var collection = db.collection(COLLECTION_NAME);
//     // await collection.insertOne({
//     //   "username": 'Shubham Wani',
//     //   "email":"shubhamwani2508@gmail.com",
//     // });
//     print(await collection.find().toList());
//   }
// }