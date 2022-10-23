import 'dart:convert';
import 'package:whatnews/models/source/news_source_model.dart';

class NewsArticleSourceResponseModel {
  NewsArticleSourceResponseModel({
    required this.status,
    required this.sources,
  });

  final String status;
  final List<NewsSourceModel> sources;

  factory NewsArticleSourceResponseModel.fromJson(String str) =>
      NewsArticleSourceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsArticleSourceResponseModel.fromMap(Map<String, dynamic> json) =>
      NewsArticleSourceResponseModel(
        status: json["status"],
        sources: List<NewsSourceModel>.from(
            json["sources"].map((source) => NewsSourceModel.fromMap(source))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
      };
}
