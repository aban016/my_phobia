import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:my_phobia/screens/components/background.dart';

class ExperienceLevelsScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;

  const ExperienceLevelsScreen({
    super.key,
    this.title,
    this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> levels = [
      {"name": "Level 01", "status": "Free", "locked": false},
      {"name": "Level 02", "status": "Locked", "locked": true},
      {"name": "Level 03", "status": "Locked", "locked": true},
      {"name": "Level 04", "status": "Locked", "locked": true},
      {"name": "Level 05", "status": "Locked", "locked": true},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(imagePath: "images/home.png"),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Top bar
                  Row(
                  children: [
                    _blurCircleIcon(Icons.arrow_back, onTap: () {
                      Navigator.pop(context);
                    }),
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
                    title ?? "Experience 01",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Level cards
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
                            title: Text(
                              level["name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              ),
                            ),
                            subtitle: level["locked"]
                                ? const HugeIcon(
                                  icon: HugeIcons.strokeRoundedLocked,
                                  color: Colors.white,
                                  size: 24,
                                )
                                : const Text(
                                    "Free",
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 6,
                                ),
                              ),
                              child: const Text(
                                "Start Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reuse the blur circle icon from main screen
  Widget _blurCircleIcon(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
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
      ),
    );
  }
}
