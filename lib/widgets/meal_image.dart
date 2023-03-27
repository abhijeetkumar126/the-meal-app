import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  const MealImage({
    super.key,
    required this.url,
    this.height,
    this.width,
  });
  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url;
    return Container(
      height: height,
      width: width,
      color: Colors.grey.withOpacity(0.2),
      child: imageUrl == null
          ? null
          : CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
    );
  }
}
