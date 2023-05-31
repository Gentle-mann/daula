import 'package:flutter/material.dart';

import '../constants.dart';

class NewsCategories extends StatelessWidget {
  const NewsCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},           
              child: Container(
              
              child: Chip(
                label: Text(categories[index]),
                side: BorderSide.none,
                backgroundColor: Colors.grey,
                shape: 
  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(6),

                ),
              ),
            ),
            );

          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: categories.length),
    );
  }
}
