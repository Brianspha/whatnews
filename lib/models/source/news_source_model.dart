import 'dart:convert';

import '../../shared/ui/enums.dart';

class NewsSourceModel {
  NewsSourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  final String id;
  final String name;
  final String description;
  final String url;
  final NewsCategory? category;
  final String language;
  final String country;

  factory NewsSourceModel.fromJson(String str) =>
      NewsSourceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsSourceModel.fromMap(Map<String, dynamic> json) => NewsSourceModel(
        id: json["id"] ?? "Unknown",
        name: json["name"] ?? "Unknown",
        description: json["description"] ?? "Unknown",
        url: json["url"] ?? "Unknown",
        category: categoryValues.map![json["category"]] ?? NewsCategory.GENERAL,
        language: json["language"] ?? "Unknown",
        country: json["country"] ?? "Unknown",
      );

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "description": description,
      "url": url,
      "category": categoryValues.reverse[category],
      "language": language,
      "country": country,
    };
  }
}
