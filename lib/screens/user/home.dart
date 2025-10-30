import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/cardsrow.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/user/subscription_purchase.dart';
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
                          left: 16, right: 16, top: 30, bottom: 10),
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
                              fontSize: 32,
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
                    // ✅ Subscription Area (with gradient border)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF5A626),
                                Color(0xFFEE3A8E),
                                Color(0xFF8944CD),
                                Color(0xFF5222E8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF01122F),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Monthly Plan",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // ✅ Subscription Items
                                _subscriptionItem("All experiences with all levels."),
                                _subscriptionItem("Extra 05% off on virtual therapy sessions."),

                                SizedBox(height: 12),
                                GradientButton(text: "Subscribe For \$100.00", onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SubscriptionPurchaseScreen()),
                                  );
                                }),
                              ],
                            ),
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
  Widget _blurCircleIcon(String imagePath) {
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
        const Divider(color: Colors.white, thickness: 1.5),
        SizedBox(height: 6),
      ],
    );
  }
}
