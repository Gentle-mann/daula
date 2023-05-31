import 'package:flutter/material.dart';

import 'recents_card.dart';

class Recents extends StatelessWidget {
  const Recents({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          index,
          (index) => const RecentsCard(),
        ),
      ),
    );
  }
}
