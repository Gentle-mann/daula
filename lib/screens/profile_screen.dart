import 'package:flutter/material.dart';

import '../models/user_settings.dart';
import '../widgets/profile_completion.dart';
import '../widgets/profile_progress.dart';
import '../widgets/profile_tile.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final settings = UserSettings.settings;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const Column(children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/photo.jpg',
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Khaleefa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ]),
          const SizedBox(height: 24),
          const Row(
            children: [
              Text('Your Profile'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              5,
              (index) => ProfileProgress(
                index: index,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.5,
              child: const ProfileCompletionCard()),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                settings.length,
                (index) => ProfileTile(
                  settings: settings[index],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
