import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/experience_levels_screen.dart';

class Immersive extends StatelessWidget {
  const Immersive({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidthForAspectRatio = MediaQuery.of(context).size.width;
    final double gridAspectRatio = screenWidthForAspectRatio <= 350 ? 0.9 : 0.8;
    final List<Map<String, String>> _experiences = [
      {
        "title": "Experience 01",
        "subtitle": "Crowded Streets",
        "image": "https://images.unsplash.com/photo-1698132979679-f188396e56a1?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Experience 02",
        "subtitle": "Social Gatherings",
        "image": "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Experience 03",
        "subtitle": "Bridges",
        "image": "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Experience 04",
        "subtitle": "Heights",
        "image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Experience 05",
        "subtitle": "Funerals",
        "image": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Experience 06",
        "subtitle": "On Dates",
        "image": "https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=800&q=80",
      },
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(imagePath: "assets/images/home.png"),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Top bar
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
                              Navigator.pop(context);
                            },
                            child: _blurCircleIcon("assets/images/icons/back.png"),
                          ),
                          const Text(
                            "Immersive Exposure",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          _blurCircleIcon("assets/images/icons/bell.png"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Title
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Exposure Experiences",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 GridView
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: gridAspectRatio,
                      ),
                      itemCount: _experiences.length,
                      itemBuilder: (context, index) {
                        final exp = _experiences[index];

                        // Navigation logic
                        VoidCallback navigateToScreen;
                        if (index == 0) {
                          // Only first one redirects
                          navigateToScreen = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExperienceLevelsScreen(),
                              ),
                            );
                          };
                        } else {
                          // Others show "Coming soon!"
                          navigateToScreen = () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("This experience is coming soon!"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          };
                        }

                        return _experienceCard(
                          context: context, // Pass context for width check
                          image: exp['image']!,
                          title: exp['title']!,
                          subtitle: exp['subtitle']!,
                          onPressed: navigateToScreen, // ✅ Fixed here
                        );
                      },
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

  // 🔹 Experience Card widget (add context param for sizing)
  Widget _experienceCard({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonFontSize = screenWidth <= 350 ? 12 : 18;
    final double titleFontSize = screenWidth <= 350 ? 22 : 28;
    final double subtitleFontSize = screenWidth <= 350 ? 12 : 18;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF5244F3).withOpacity(0.8),
                  const Color.fromARGB(255, 25, 18, 109).withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Title Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),

                // 🔹 Button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                    ),
                    child: Text(
                      "Start Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: buttonFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
