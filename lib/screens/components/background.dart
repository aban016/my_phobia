import 'dart:ui';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String? imagePath; // optional parameter

  const Background({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // 🔹 Base dark background
        Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color(0xFF090A13),
        ),

        // 🔹 Blurred image background (top area)
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.6,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath ?? "assets/images/background.png",
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ],
          ),
        ),

        // 🔹 Purple glow in bottom-left corner
       Positioned(
        bottom: -40,
        left: -80,
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0xFF5244F3).withOpacity(0.25), // softer center glow
                const Color(0xFF5244F3).withOpacity(0.0),  // fade outward
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5244F3).withOpacity(0.15), // lighter glow shadow
                blurRadius: 120,
                spreadRadius: 30,
              ),
            ],
          ),
        ),
      ),


      ],
    );
  }
}
