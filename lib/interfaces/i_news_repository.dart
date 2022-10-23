import 'package:whatnews/models/article/news_article_model.dart';

import '../models/article/news_article_request_model.dart';
import '../models/source/news_source_model.dart';

/// @dev File contains function signatures for any client to implement if it inherits from the class
abstract class INewsRepository {
  /// @dev function updates cache manager instance from singleton
  void setAppCacheManager();

  /// @dev function initialises API service
  ///  @params baseURL the URL which will be used in querying news articles
  ///   @params apiKey The API Key provided by the API provider
  Future<void> setupAPIService(String? baseURL, String? apiKey);

  /// @dev function returns a list of news articles based on the NewsArticleRequestModel
  /// @params newsArticleRequestModel contains parameters used for querying a given news api see models folder for implementation
  Future<List<NewsArticleModel>> getNewArticles(
      NewsArticleRequestModel newsArticleRequestModel);

  /// @dev function returns a list of news articles that mention a text or word
  /// @params newsArticleRequestModel contains parameters used for querying a given news api see models folder for implementation
  Future<List<NewsArticleModel>> getNewArticlesMentions(
      NewsArticleRequestModel newsArticleRequestModel);

  /// @dev function returns a list of news articles by Source
  /// @params newsArticleRequestModel contains parameters used for querying a given news api see models folder for implementation
  Future<List<NewsArticleModel>> getNewArticlesBySource(
      NewsArticleRequestModel newsArticleRequestModel);

  /// @dev function returns a list of news sources
  Future<List<NewsSourceModel>> getNewsSources();

  /// @dev function returns a list of news articles by Source and Country
  /// @params newsArticleRequestModel contains parameters used for querying a given news api see models folder for implementation
  Future<List<NewsArticleModel>> getNewArticlesBySourceAndCountry(
      NewsArticleRequestModel newsArticleRequestModel);
}
