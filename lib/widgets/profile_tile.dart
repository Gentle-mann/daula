import 'package:flutter/material.dart';

import '../models/user_settings.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.settings});
  final UserSettings settings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 6),
      child: Card(
          elevation: 4,
          shadowColor: Colors.grey,
          child: ListTile(
            leading: Icon(settings.icon,
                color:
                    settings.title == 'Logout' ? Colors.red : Colors.black12),
            title: Text(settings.title,
                style: const TextStyle(color: Colors.black)),
            trailing: const Icon(Icons.chevron_right),
          )),
    );
  }
}
