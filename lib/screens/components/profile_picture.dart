import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String imagePath;
  final double size;
  final double borderWidth;

  const ProfilePicture({
    super.key,
    required this.imagePath,
    this.size = 55,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFEE3A8E), width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEE3A8E).withOpacity(0.5),
            blurRadius: 0,
            spreadRadius: 4,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: size / 2,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}

