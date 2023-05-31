import 'package:flutter/material.dart';
import 'package:daula/models/news_model.dart';

class RecommendationTile extends StatelessWidget {
  const RecommendationTile({
    super.key,
    required this.article,
    required this.onTap,
    this.fontSize = 8,
  });
  final Article article;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: article.urlToImage == null
                  ? const SizedBox.shrink()
                  : buildImage(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  newsTitle(),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      authorImage(),
                      article.author == null
                          ? const SizedBox.shrink()
                          : Text(article.author!),
                      smallText('.'),
                      smallText(
                        '${DateTime.now().difference(DateTime.parse(article.publishedAt)).inDays} days ago',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallText(text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12),
    );
  }

  newsTitle() {
    return Text(article.title);
  }

  authorImage() {
    if (article.urlToImage == null) {
      return const SizedBox.shrink();
    } else {
      return CircleAvatar(
        radius: 2,
        backgroundImage: NetworkImage(
          article.urlToImage!,
        ),
      );
    }
  }

  authorName() {}

  buildDot() {}

  buildDate() {}

  buildImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(article.urlToImage!),
        ),
      ),
    );
  }
}
