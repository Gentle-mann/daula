import 'package:daula/network/articles_service.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
  static const String routeName = '/';
}

class _DemoScreenState extends State<DemoScreen> {
  late Future<List<Article>> articles;
  @override
  void initState() {
    super.initState();
    articles = NewsService.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daula Demo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
              initialData: const [],
              future: articles,
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? const CircularProgressIndicator()
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return ListTile(
                            leading: Text(data!.publishedAt),
                            title: Text(
                              data.title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 4,
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
              }),
        ),
      ),
    );
  }
}
