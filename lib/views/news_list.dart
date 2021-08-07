import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/article_list_viewmodel.dart';
import 'package:news_app/views/news_details.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticleListViewModel>(context, listen: false)
        .populateArticles();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Newsreader')),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          itemCount: viewModel.articles.length,
          itemBuilder: (context, index) {
            final article = viewModel.articles[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                splashColor: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsDetails(article: article)));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Hero(
                        tag: article,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11),
                                topRight: Radius.circular(11)),
                            image: DecorationImage(
                              image: article.image != null
                                  ? NetworkImage(article.image!)
                                  : NetworkImage(imageNotAvailable),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        article.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        article.description,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
