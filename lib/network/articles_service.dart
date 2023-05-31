import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../models/news_model.dart';

class NewsService {
  static const String apiUrl =
      'https://newsapi.org/v2/everything?q=keyword&apiKey=9bb13f84d43243cc9db40b090fe8634e';
  static Future<List<Article>> getNews() async {
    print('jsut passign');
    final response = await get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      final news = NewsModel.fromJson(
        jsonDecode(response.body),
      );

      print('success: ${news.articles.first}');
      return news.articles;
    } else {
      log(response.body);
      throw Exception(response.statusCode);
    }
  }
}
