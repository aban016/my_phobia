import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/user/immersive.dart';
import 'package:my_phobia/screens/user/virtual_therapy.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class CardsRow extends StatelessWidget {
  const CardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 50) / 2; // responsive 2 cards layout (20px margin + 20px gap)
    double cardHeight = 200;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First Card
          _buildCard(
            context,
            title: "Immersive Exposure",
            color: const Color(0xFF5244F3),
            textColor: Colors.deepPurple,
            width: cardWidth,
            height: cardHeight,
          ),

          // Second Card
          _buildBlurCard(
            context,
            title: "Virtual Therapy",
            textColor: Colors.teal,
            width: cardWidth,
            // height: cardHeight,
          ),
        ],
      ),
    );
  }

  // 🔹 Normal Colored Card
  Widget _buildCard(
    BuildContext context, {
    required String title,
    required Color color,
    required Color textColor,
    required double width,
    required double height,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double textFontSize = screenWidth <= 350 ? 18 : 26;
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width,
        // height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: textFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 18,),
            SizedBox(
              height: 36,
              width: 109,
              child: GradientButton(
                text: "See Details",
                height: 36,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                borderRadius: 32,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Immersive()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Blur Card
  Widget _buildBlurCard(
    BuildContext context, {
    required String title,
    required Color textColor,
    required double width,
    // required double height,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double textFontSize = screenWidth <= 350 ? 18 : 26;
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
        child: Container(
          width: width,
          // height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(32),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 18,),
              SizedBox(
                height: 36,
                width: 109,
                child: GradientButton(
                  text: "See Details",
                  height: 36,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  borderRadius: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VirtualTherapyScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
