import 'package:scoped_model/scoped_model.dart';
import 'package:whatnews/models/source/news_source_model.dart';

import '../models/article/news_article_model.dart';

class NewsRepositoryScopedModel extends Model {
  List<NewsArticleModel> _newsArticles = <NewsArticleModel>[];
  List<NewsSourceModel> newsSources = <NewsSourceModel>[];
  List<NewsArticleModel> get getLatestNewsArticles => _newsArticles;
  List<NewsSourceModel> get getNewsSources => newsSources;

  void setLatestNewsArticles(List<NewsArticleModel> articles) {
    _newsArticles = articles;
    notifyListeners();
  }

  void setLatestSources(List<NewsSourceModel> sources) {
    newsSources = sources;
    notifyListeners();
  }
}
