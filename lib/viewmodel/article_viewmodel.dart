import 'package:news_app/model/article_model.dart';

class ArticleViewModel {
  final Article _article;

  ArticleViewModel({required Article article}) : _article = article;

  String get title => _article.title;
  String get description => _article.description;
  String get url => _article.url;
  String get source => _article.source;
  String? get image => _article.image;
  String get category => _article.category;
  String get language => _article.language;
  String get country => _article.country;
  String get publishedAt => _article.publishedAt;
}
