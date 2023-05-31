import 'package:flutter/material.dart';

class ProfileProgress extends StatelessWidget {
  const ProfileProgress({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      margin: EdgeInsets.only(right: index == 4 ? 4 : 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: index == 0 ? Colors.purple : Colors.grey,
      ),
    );
  }
}
