import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomNavItem(Icons.bar_chart, "Progress Tracking", Color(0xFF320F7D), 0),
          _bottomNavItem(Icons.home, "Home", Color(0xFF320F7D), 1, isActive: true),
          _bottomNavItem(Icons.support_agent, "Holistic Support", Color(0xFF320F7D), 2),
        ],
      ),
    );
  }

  // 🔹 Bottom Nav Item
  Widget _bottomNavItem(IconData icon, String label, Color color, int index,
      {bool isActive = false}) {
    final bool active = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          decoration: BoxDecoration(
            color: active ? color : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:  const Radius.circular(30),
              topRight:  const Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: active ? Colors.white : color, size: 24,),
              Text(
                label,
                style: TextStyle(
                  color: active ? Colors.white : color,
                  fontSize: 12,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
