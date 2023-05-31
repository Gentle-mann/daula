import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.headerTitle,
      required this.fontSize,
      this.headerRow = true});
  final String headerTitle;
  final double fontSize;
  final bool headerRow;

  @override
  Widget build(BuildContext context) {
    const String viewAll = 'View all';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerTitle,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: headerRow ? const Text(viewAll) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
