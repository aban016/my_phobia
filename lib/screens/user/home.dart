import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/cardsrow.dart';
import 'package:my_phobia/screens/components/daily_thought_card.dart';
import 'package:my_phobia/screens/user/notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ✅ Background
          Background(imagePath: "assets/images/home.png"),

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
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: _blurCircleIcon("assets/images/icons/menubar.png"),
                          ),
                          const Text(
                            "Hi, Tetiana!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/notification');
                            },
                            child: _blurCircleIcon("assets/images/icons/bell.png"),
                          ),
                        ],
                      ),
                    ),

                    // ✅ Daily Thought Card
                    DailyThoughtCard(screenWidth: screenWidth),

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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 26),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
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
  Widget _blurCircleIcon(String imagePath, {VoidCallback? onTap = null}) {
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
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              imagePath,
              color: Colors.white,
              width: 24,
              height: 24,
            ),
          ),
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
            const Icon(CupertinoIcons.check_mark, color: Colors.white, size: 16),
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
