import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text, this.fontSize = 12});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
