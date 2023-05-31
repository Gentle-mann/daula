import 'package:flutter/material.dart';

class UserSettings {
  final String title;
  final IconData icon;

  UserSettings({required this.title, required this.icon});
  static final List<UserSettings> settings = [
    UserSettings(title: 'My Profile', icon: Icons.person),
    UserSettings(title: 'My Collection', icon: Icons.cast),
    UserSettings(title: 'Settings', icon: Icons.settings),
    UserSettings(title: 'Logout', icon: Icons.arrow_right),
  ];
}
