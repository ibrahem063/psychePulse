import 'package:flutter/material.dart';
class CircularProfilePicture extends StatelessWidget {
  final String imagePath;
  final double radius;

  CircularProfilePicture({
    required this.imagePath,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: 2 * radius,
        height: 2 * radius,
        fit: BoxFit.cover,
      ),
    );
  }
}