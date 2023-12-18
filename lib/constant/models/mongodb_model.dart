// import 'dart:convert';
//
// import 'package:mongo_dart/mongo_dart.dart';
//
// MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));
//
// String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());
//
// class MongoDbModel {
//   ObjectId id;
//   String username;
//   String email;
//   String password;
//
//   MongoDbModel({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.password,
//   });
//
//   factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
//     id: json["id"],
//     username: json["username"],
//     email: json["email"],
//     password: json["password"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "email": email,
//     "password": password,
//   };
// }