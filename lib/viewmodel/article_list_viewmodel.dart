import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/webservice.dart';
import 'package:news_app/viewmodel/article_viewmodel.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<ArticleViewModel> articles = <ArticleViewModel>[];

  Future<void> populateArticles() async {
    List<Article> newsArticles = await WebService().fetchNewsArticles();
    this.articles = newsArticles
        .map((article) => ArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }
}
