import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/user/subscription_purchase.dart';

class ExperienceLevelsScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final bool isSubscribedUser;

  const ExperienceLevelsScreen({
    super.key,
    this.title,
    this.subtitle,
    this.image,
    this.isSubscribedUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> levels = [
      {"name": "Level 01", "status": isSubscribedUser ? "Completed" : "In-complete"},
      {"name": "Level 02", "status": "In-complete"},
      {"name": "Level 03", "status": "In-complete"},
      {"name": "Level 04", "status": "In-complete"},
      {"name": "Level 05", "status": "In-complete"},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(imagePath: "assets/images/home.png"),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  // 🔹 Top bar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: _blurCircleIcon(Iconsax.arrow_left),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            subtitle ?? "Crowded Street",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Experiences",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Levels + Subscribe placement
                  if (isSubscribedUser) ...[
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: levels.length,
                        itemBuilder: (context, index) {
                          final level = levels[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5244F3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              title: Text(
                                level["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: _statusChip(level["status"]),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Only Level 01
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF5244F3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                title: const Text(
                                  "Level 01",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: _startNowButton(),
                              ),
                            ),

                            const SizedBox(height: 55),

                            // Subscribe section directly under Level 01
                            const Center(
                              child: Text(
                                "Subscribe for More",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                "Subscribe now to unlock the next level of insights\nand exclusive experiences.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                  height: 1.4,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                    GradientButton(
                      text: "Subscribe For \$100.00",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubscriptionPurchaseScreen(),
                          ),
                        );
                      },
                    ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Blur Circle Icon (supports Iconsax icon)
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
          child: const Center(
            child: Icon(
              Iconsax.arrow_left_copy,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Status chip for subscribed users
  Widget _statusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // 🔹 Start Now button for free level when not subscribed
  Widget _startNowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "Start Now",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
