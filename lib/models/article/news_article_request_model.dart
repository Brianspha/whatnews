
class NewsArticleRequestModel {
  NewsArticleRequestModel({
    required this.source,
    required this.articleMentions,
    required this.numberOfArticles,
    required this.country,
  });

  final String source;
  final String articleMentions;
  final String country;
  final int numberOfArticles;
}
