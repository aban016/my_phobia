import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/cardsrow.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ✅ Background
          Background(imagePath: "images/home.png"),

          // ✅ Scrollable Body
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100), // space for bottom nav
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Top Bar
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.06,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _blurCircleIcon(Icons.menu),
                          const Text(
                            "Hi, Tetiana!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          _blurCircleIcon(Icons.notifications),
                        ],
                      ),
                    ),

                    // ✅ Daily Thought Card
                    Container(
                      width: screenWidth,
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF090A13),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("images/mask.png"),
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
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Color(0xFF090A13),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // ✅ Services Heading
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // ✅ Cards Row (scrollable horizontally)
                    const CardsRow(),

                    const SizedBox(height: 20),
                    // ✅ Services Heading
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Subscription",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // ✅ Subscription Area
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0F1636), Color(0xFF1D0E2F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Standard - Plan",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // ✅ Subscription Items
                          _subscriptionItem("Lorem Ipsum Dorsi Collab Episum lore"),
                          _subscriptionItem("Lorem Ipsum Dorsi Collab Episum lore"),
                          _subscriptionItem("Lorem Ipsum Dorsi Collab Episum lore"),
                          _subscriptionItem("Lorem Ipsum Dorsi Collab Episum lore"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Blur Circle Icon
  Widget _blurCircleIcon(IconData icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  // 🔹 Subscription Item
  Widget _subscriptionItem(String text) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.check, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        const Divider(color: Colors.white24, thickness: 1),
      ],
    );
  }
}
