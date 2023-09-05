

import 'package:meta/meta.dart';
import 'dart:convert';

List<NewPostModel> newPostModelFromMap(String str) => List<NewPostModel>.from(json.decode(str).map((x) => NewPostModel.fromMap(x)));

String newPostModelToMap(List<NewPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class NewPostModel {
  int userId;
  int id;
  String title;
  String body;

  NewPostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory NewPostModel.fromMap(Map<String, dynamic> json) => NewPostModel(
    userId: json["userId"]??0,
    id: json["id"]??0,
    title: json["title"]??"",
    body: json["body"]??"",
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
