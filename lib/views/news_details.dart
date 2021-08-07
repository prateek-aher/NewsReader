import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:news_app/viewmodel/article_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.article}) : super(key: key);
  final ArticleViewModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Hero(
              tag: article,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: article.image != null
                      ? NetworkImage(article.image!)
                      : NetworkImage(imageNotAvailable),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    article.language.toUpperCase() +
                        '-' +
                        article.country.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(DateFormat('MMM d, yyyy')
                    .format(DateTime.parse(article.publishedAt)))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Category: ' +
                      article.category.substring(0, 1).toUpperCase() +
                      article.category.substring(1).toLowerCase(),
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(height: 8),
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  article.description,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 12),
                OutlinedButton(
                    onPressed: () async {
                      if (await canLaunch(article.url)) {
                        await launch(article.url);
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Failed',
                          backgroundColor: Colors.grey,
                          textColor: Theme.of(context).primaryColor,
                        );
                      }
                    },
                    child: Text('Read the article here')),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        0, size.height * 0.9, size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.quadraticBezierTo(
        size.width, size.height * 0.9, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
