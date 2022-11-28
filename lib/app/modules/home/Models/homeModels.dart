// To parse this JSON data, do
//
//     final homeModels = homeModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HomeModels> homeModelsFromJson(String str) =>
    List<HomeModels>.from(json.decode(str).map((x) => HomeModels.fromJson(x)));

String homeModelsToJson(List<HomeModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModels {
  HomeModels({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory HomeModels.fromJson(Map<String, dynamic> json) => HomeModels(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
