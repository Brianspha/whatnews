import 'dart:convert';

class NewsArticleSourceModel {
  NewsArticleSourceModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory NewsArticleSourceModel.fromJson(String str) =>
      NewsArticleSourceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsArticleSourceModel.fromMap(Map<String, dynamic> json) =>
      NewsArticleSourceModel(
          id: json["id"] ?? "", name: json["name"] ?? "Unknown");

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
