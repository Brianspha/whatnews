import 'dart:convert';
import 'package:whatnews/models/article/news_article_source_model.dart';

class NewsArticleModel {
  NewsArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final NewsArticleSourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  factory NewsArticleModel.fromJson(String str) =>
      NewsArticleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsArticleModel.fromMap(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: NewsArticleSourceModel.fromMap(json["source"]),
      author: json["author"] ?? "Unknown",
      title: json["title"] ?? "Unknown",
      description: json["description"] ?? "Unknown",
      url: json["url"] ?? "Unknown",
      urlToImage: json["urlToImage"] ?? "Unknown",
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"] ?? "Unknown",
    );
  }

  Map<String, dynamic> toMap() => {
        "source": source.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}
