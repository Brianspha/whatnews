import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:whatnews/classes/app_cache.dart';
import 'package:whatnews/interfaces/i_news_repository.dart';
import 'package:whatnews/models/article/news_article_model.dart';
import 'package:whatnews/models/article/news_article_request_model.dart';
import 'package:whatnews/models/article/news_article_response_model.dart';
import 'package:whatnews/models/source/news_article_source_response_model.dart';
import 'package:whatnews/services/api/news_api_service.dart';

import '../../locators/service_locator.dart';
import '../../models/source/news_source_model.dart';

class NewsRepository extends INewsRepository {
  NewsAPIService? _apiService; //@dev late keyword means we init later
  String? _apiKey;
  AppCacheManager? appCacheManager;
  @override
  Future<void> setupAPIService(String? baseURL, String? apiKey) async {
    _apiService = NewsAPIService(baseURL: baseURL);
    _apiKey = apiKey;
  }

  @override
  void setAppCacheManager() {
    appCacheManager = locator.get<AppCacheManager>();
  }

  @override
  Future<List<NewsArticleModel>> getNewArticles(
      NewsArticleRequestModel newsArticleRequestModel) async {
    List<NewsArticleModel> newsArticles = <NewsArticleModel>[];
    try {
      /**/ String? cachedArticles = await appCacheManager
          ?.getCacheValue("allArticles:${newsArticleRequestModel.country}");
      if (cachedArticles != null && cachedArticles.isNotEmpty) {
        dynamic decodeArticles = jsonDecode(cachedArticles);
        for (dynamic article in decodeArticles) {
          newsArticles.add(NewsArticleModel.fromMap(article));
        }
      } else {
        Response? articles = await _apiService?.httpGet("top-headlines",
            {"country": newsArticleRequestModel.country, "apiKey": _apiKey});
        NewsArticleResponseModel newsArticleResponseModel =
            NewsArticleResponseModel.fromMap(articles?.data);
        newsArticles = newsArticleResponseModel.articles
            .where((article) =>
                article.description != "Unknown" &&
                article.author != "Unknown" &&
                article.title != "Unknown" &&
                article.content != "Unknown" &&
                article.url != "Unknown" &&
                article.source.name != "Unknown" &&
                article.urlToImage != "Unknown")
            .toList();
        var cacheArticlesMap = [];
        for (NewsArticleModel article in newsArticles) {
          cacheArticlesMap.add(article.toMap());
        }
        if (cacheArticlesMap.isNotEmpty) {
          await appCacheManager?.writeCacheValue(
              "allArticles:${newsArticleRequestModel.country}",
              jsonEncode(cacheArticlesMap),
              const Duration(hours: 1));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("error fetching articles: ${error.toString()}");
      }
    }
    return newsArticles;
  }

  @override
  Future<List<NewsArticleModel>> getNewArticlesBySource(
      NewsArticleRequestModel newsArticleRequestModel) async {
    // TODO: implement getNewArticlesBySource
    List<NewsArticleModel> newsArticles = <NewsArticleModel>[];
    try {
      /**/ String? cachedArticles = await appCacheManager
          ?.getCacheValue("articleSource:${newsArticleRequestModel.source}");
      if (cachedArticles != null && cachedArticles.isNotEmpty) {
        dynamic decodeArticles = jsonDecode(cachedArticles);
        for (dynamic article in decodeArticles) {
          newsArticles.add(NewsArticleModel.fromMap(article));
        }
      } else {
        Response? articles = await _apiService?.httpGet("top-headlines",
            {"sources": newsArticleRequestModel.source, "apiKey": _apiKey});
        NewsArticleResponseModel newsArticleResponseModel =
            NewsArticleResponseModel.fromMap(articles?.data);
        newsArticles = newsArticleResponseModel.articles
            .where((article) =>
                article.description != "Unknown" &&
                article.author != "Unknown" &&
                article.title != "Unknown" &&
                article.content != "Unknown" &&
                article.url != "Unknown" &&
                article.source.name != "Unknown" &&
                article.urlToImage != "Unknown")
            .toList();
        var cacheArticlesMap = [];
        for (NewsArticleModel article in newsArticles) {
          cacheArticlesMap.add(article.toMap());
        }
        if (cacheArticlesMap.isNotEmpty) {
          await appCacheManager?.writeCacheValue(
              "articleSource:${newsArticleRequestModel.source}",
              jsonEncode(cacheArticlesMap),
              const Duration(hours: 1));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(
            "error fetching articles by source: ${newsArticleRequestModel.source} error: ${error.toString()}");
      }
    }
    return newsArticles;
  }

  @override
  Future<List<NewsArticleModel>> getNewArticlesMentions(
      NewsArticleRequestModel newsArticleRequestModel) async {
    // TODO: implement getNewArticlesMentions
    List<NewsArticleModel> newsArticles = <NewsArticleModel>[];
    try {
      /**/ String? cachedArticles = await appCacheManager?.getCacheValue(
          "articleMentions:${newsArticleRequestModel.articleMentions}");
      if (cachedArticles != null && cachedArticles.isNotEmpty) {
        dynamic decodeArticles = jsonDecode(cachedArticles);
        for (dynamic article in decodeArticles) {
          newsArticles.add(NewsArticleModel.fromMap(article));
        }
      } else {
        Response? articles = await _apiService?.httpGet("top-headlines",
            {"q": newsArticleRequestModel.articleMentions, "apiKey": _apiKey});
        NewsArticleResponseModel newsArticleResponseModel =
            NewsArticleResponseModel.fromMap(articles?.data);
        newsArticles = newsArticleResponseModel.articles
            .where((article) =>
                article.description != "Unknown" &&
                article.author != "Unknown" &&
                article.title != "Unknown" &&
                article.content != "Unknown" &&
                article.url != "Unknown" &&
                article.source.name != "Unknown" &&
                article.urlToImage != "Unknown")
            .toList();
        var cacheArticlesMap = [];
        for (NewsArticleModel article in newsArticles) {
          cacheArticlesMap.add(article.toMap());
        }
        if (cacheArticlesMap.isNotEmpty) {
          await appCacheManager?.writeCacheValue(
              "articleMentions:${newsArticleRequestModel.country}",
              jsonEncode(cacheArticlesMap),
              const Duration(hours: 1));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(
            "error fetching articles that mention: ${newsArticleRequestModel.articleMentions} error: ${error.toString()}");
      }
    }
    return newsArticles;
  }

  @override
  Future<List<NewsSourceModel>> getNewsSources() async {
    List<NewsSourceModel> sources = [];
    try {
      /**/
      String? cachedSources =
          await appCacheManager?.getCacheValue("newsSources");
      if (cachedSources != null && cachedSources.isNotEmpty) {
        dynamic decodeArticles = jsonDecode(cachedSources);
        for (dynamic source in decodeArticles) {
          sources.add(NewsSourceModel.fromMap(source));
        }
      } else {
        Response? sourcesData = await _apiService
            ?.httpGet("top-headlines/sources", {"apiKey": _apiKey});
        NewsArticleSourceResponseModel newsArticleSourceResponseModel =
            NewsArticleSourceResponseModel.fromMap(sourcesData?.data);
        sources = newsArticleSourceResponseModel.sources
            .where((source) =>
                source.description != "Unknown" &&
                source.url != "Unknown" &&
                source.name != "Unknown" &&
                source.description != "Unknown" &&
                source.country != "Unknown" &&
                source.language != "Unknown")
            .toList();
        List<dynamic> cacheSourcesMap = [];
        for (NewsSourceModel source in sources) {
          cacheSourcesMap.add(source.toMap());
        }
        if (cacheSourcesMap.isNotEmpty) {
          await appCacheManager?.writeCacheValue("newsSources",
              jsonEncode(cacheSourcesMap), const Duration(hours: 1));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("error getting news sources: ${error.toString()}");
      }
    }
    return sources;
  }

  @override
  Future<List<NewsArticleModel>> getNewArticlesBySourceAndCountry(
      NewsArticleRequestModel newsArticleRequestModel) async {
    List<NewsArticleModel> newsArticles = <NewsArticleModel>[];
    try {
      /**/ String? cachedArticles = await appCacheManager
          ?.getCacheValue("articleSource:${newsArticleRequestModel.source}");
      if (cachedArticles != null && cachedArticles.isNotEmpty) {
        dynamic decodeArticles = jsonDecode(cachedArticles);
        for (dynamic article in decodeArticles) {
          newsArticles.add(NewsArticleModel.fromMap(article));
        }
      } else {
        Response? articles = await _apiService?.httpGet("top-headlines",
            {"sources": newsArticleRequestModel.source, "apiKey": _apiKey});
        NewsArticleResponseModel newsArticleResponseModel =
            NewsArticleResponseModel.fromMap(articles?.data);
        newsArticles = newsArticleResponseModel.articles
            .where((article) =>
                article.description != "Unknown" &&
                article.author != "Unknown" &&
                article.title != "Unknown" &&
                article.content != "Unknown" &&
                article.url != "Unknown" &&
                article.source.name != "Unknown" &&
                article.urlToImage != "Unknown")
            .toList();
        var cacheArticlesMap = [];
        for (NewsArticleModel article in newsArticles) {
          cacheArticlesMap.add(article.toMap());
        }
        if (cacheArticlesMap.isNotEmpty) {
          await appCacheManager?.writeCacheValue(
              "articleSource:${newsArticleRequestModel.source}",
              jsonEncode(cacheArticlesMap),
              const Duration(hours: 1));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(
            "error fetching articles by source: ${newsArticleRequestModel.source} error: ${error.toString()}");
      }
    }
    return newsArticles;
  }
}
