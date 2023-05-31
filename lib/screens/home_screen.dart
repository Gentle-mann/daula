import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../network/articles_service.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_row.dart';
import '../widgets/news_builder.dart';
import '../widgets/recents.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final Future<List<Article>> articles = NewsService.getNews();

  @override
  Widget build(BuildContext context) {
    const totalIndex = 4;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SectionHeader(headerTitle: 'Breaking News', fontSize: 32),
              const Recents(index: totalIndex),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  totalIndex,
                  (index) => _buildDot(index),
                ),
              ),
              const SizedBox(height: 20),
              const SectionHeader(headerTitle: 'Recommendation', fontSize: 28),
              const SizedBox(height: 12),
              Expanded(child: NewsBuilder(articles: articles)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  _buildDot(index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: index == 3 ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index == 3 ? Colors.blue : Colors.grey,
      ),
    );
  }
}
