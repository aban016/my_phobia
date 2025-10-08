import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/immersive.dart';
import 'package:my_phobia/screens/virtual_therapy.dart';

class CardsRow extends StatelessWidget {
  const CardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 60) / 2; // responsive 2 cards layout (20px margin + 20px gap)
    double cardHeight = 200;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First Card
          _buildCard(
            context,
            title: "Immersive Exposure",
            color: const Color(0xff5244F3),
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
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 18,),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Immersive()), 
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                foregroundColor: textColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Text("See Details", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
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
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 18,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VirtualTherapyScreen()), 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("See Details", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
