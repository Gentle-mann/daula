import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../network/articles_service.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_row.dart';
import '../widgets/news_builder.dart';
import '../widgets/news_categories.dart';
import '../widgets/search_field.dart';
import '../widgets/small_text.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  static const String routeName = '/discover';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final Future<List<Article>> articles = NewsService.getNews();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 24),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 12,
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                headerTitle: 'Discover',
                fontSize: 36,
                headerRow: false,
              ),
              const SizedBox(height: 8),
              const SmallText(text: 'News from all over the world'),
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: const SearchField(),
              ),
              const SizedBox(height: 12),
              const NewsCategories(),
              const SizedBox(height: 12),
              Expanded(
                child: NewsBuilder(articles: articles),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
