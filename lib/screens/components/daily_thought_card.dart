import 'package:flutter/material.dart';

class DailyThoughtCard extends StatelessWidget {
  const DailyThoughtCard({super.key, required this.screenWidth, this.marginHorizontal});
  final double screenWidth;
  final double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 20),
      decoration: BoxDecoration(
        color: const Color(0xFF090A13),
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/mask.png"),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Daily Thought",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Meditation • 3-10 MIN",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/icons/play.png',
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}