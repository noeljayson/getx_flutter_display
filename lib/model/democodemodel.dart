// To parse this JSON data, do
//
//     final demoCodeModel = demoCodeModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DemoCodeModel demoCodeModelFromMap(String str) => DemoCodeModel.fromMap(json.decode(str));

String demoCodeModelToMap(DemoCodeModel data) => json.encode(data.toMap());

class DemoCodeModel {
  int classCode;
  String className;

  DemoCodeModel({
    required this.classCode,
    required this.className,
  });

  factory DemoCodeModel.fromMap(Map<String, dynamic> json) => DemoCodeModel(
    classCode: json["ClassCode"],
    className: json["ClassName"],
  );

  Map<String, dynamic> toMap() => {
    "ClassCode": classCode,
    "ClassName": className,
  };
}
