import 'package:flutter/material.dart';

import '../models/news_model.dart';
import 'recommendation_tile.dart';

class Recommendation extends StatelessWidget {
  const Recommendation(
      {super.key, required this.articles, required this.onTap});
  final List<Article> articles;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...articles.map(
          (article) => RecommendationTile(article: article, onTap: onTap),
        ),
      ],
    );
  }
}
