// To parse this JSON data, do
//
//     final demoModel = demoModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DemoModel> demoModelFromMap(String str) => List<DemoModel>.from(json.decode(str).map((x) => DemoModel.fromMap(x)));

String demoModelToMap(List<DemoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DemoModel {
  int classCode;
  String className;

  DemoModel({
    required this.classCode,
    required this.className,
  });

  factory DemoModel.fromMap(Map<String, dynamic> json) => DemoModel(
    classCode: json["ClassCode"],
    className: json["ClassName"],
  );

  Map<String, dynamic> toMap() => {
    "ClassCode": classCode,
    "ClassName": className,
  };
}
