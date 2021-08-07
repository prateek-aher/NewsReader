import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/article_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'views/news_list.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Now',
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ArticleListViewModel>(
        create: (context) => ArticleListViewModel(),
        child: NewsList(),
      ),
    );
  }
}
