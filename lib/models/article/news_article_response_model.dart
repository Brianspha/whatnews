import 'dart:convert';
import 'package:whatnews/models/article/news_article_model.dart';

class NewsArticleResponseModel {
  NewsArticleResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<NewsArticleModel> articles;

  factory NewsArticleResponseModel.fromJson(String str) =>
      NewsArticleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsArticleResponseModel.fromMap(Map<String, dynamic> json) {
    return NewsArticleResponseModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: List<NewsArticleModel>.from(
          json["articles"].map((article) => NewsArticleModel.fromMap(article))),
    );
  }

  Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles":
            List<dynamic>.from(articles.map((article) => article.toMap())),
      };
}
