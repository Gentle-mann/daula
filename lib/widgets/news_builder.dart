import 'package:daula/widgets/recommendation_tile.dart';
import 'package:flutter/material.dart';

import '../screens/details_screen.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({
    super.key,
    required this.articles,
  });

  final Future articles;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articles,
      initialData: const [],
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return snapshot.hasData
                ? RecommendationTile(
                    article: snapshot.data[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailsScreen.routeName,
                          arguments: snapshot.data[index]);
                    },
                  )
                : const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
