import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      this.imageUrl,
      this.height,
      this.width,
      required this.borderRadius,
      this.child});
  final String? imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? const SizedBox.shrink()
        : Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          );
  }
}
