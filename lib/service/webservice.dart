import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';

class WebService {
  static String _apiBaseUrl = 'http://api.mediastack.com/v1/news';

  static String _accessKey = 'access_key=6c219d9bbc22af2f3ac50468b0a8e3e5';

  Future<List<Article>> fetchNewsArticles() async {
    Response response =
        await get(Uri.parse(_apiBaseUrl + '?' + _accessKey + '&sources=en'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => Article.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get articles');
    }
  }
}
