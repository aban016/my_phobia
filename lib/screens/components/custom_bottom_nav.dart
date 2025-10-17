import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isTherapist;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isTherapist = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          _bottomNavItem(CupertinoIcons.chart_bar_square_fill, "Progress Tracking", const Color(0xFF320F7D), 0),
          _bottomNavItem(CupertinoIcons.house_fill, "Home", const Color(0xFF320F7D), 1),
          _bottomNavItem(
            isTherapist ? CupertinoIcons.chat_bubble_2_fill : CupertinoIcons.question_circle,
            isTherapist ? "Communication" : "Holistic Support",
            const Color(0xFF320F7D),
            2
          ),
        ],
      ),
    );
  }

  // 🔹 Bottom Nav Item
  Widget _bottomNavItem(IconData icon, String label, Color color, int index) {
    final bool active = currentIndex == index;

    // Calculate border radius depending on position and activity
    BorderRadius borderRadius;
    if (active) {
      if (index == 0) {
        // Only left top rounded
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(0),
        );
      } else if (index == 1) {
        // No top rounding for middle
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        );
      } else if (index == 2) {
        // Only right top rounded
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(30),
        );
      } else {
        borderRadius = BorderRadius.zero;
      }
    } else {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      );
    }

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.ease,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: active ? color : Colors.transparent,
            borderRadius: borderRadius,
          ),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: active ? Colors.white : color,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: active ? Colors.white : color,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
