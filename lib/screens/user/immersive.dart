import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/user/experience_levels_screen.dart';

class Immersive extends StatelessWidget {
  const Immersive({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidthForAspectRatio = MediaQuery.of(context).size.width;
    final double gridAspectRatio = screenWidthForAspectRatio <= 350 ? 0.9 : 0.9;
    final List<Map<String, String>> _experiences = [
      {
        "title": "Experience 01",
        "subtitle": "Crowded Streets",
        "image": "assets/images/experiances/crowdedstreet.png",
      },
      {
        "title": "Experience 02",
        "subtitle": "Social Gatherings",
        "image": "assets/images/experiances/socialgatherings.png",
      },
      {
        "title": "Experience 03",
        "subtitle": "Bridges",
        "image": "assets/images/experiances/bridges.png",
      },
      {
        "title": "Experience 04",
        "subtitle": "Heights",
        "image": "assets/images/experiances/heights.png",
      },
      {
        "title": "Experience 05",
        "subtitle": "Funerals",
        "image": "assets/images/experiances/funerals.png",
      },
      {
        "title": "Experience 06",
        "subtitle": "On Dates",
        "image": "assets/images/experiances/dates.png",
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
                          left: 16, right: 16, top: 30, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: _blurCircleIcon(Iconsax.arrow_left),
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
                          const SizedBox(width: 48),
                        ],
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

                        // All cards redirect to ExperienceLevelsScreen
                        final VoidCallback navigateToScreen = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExperienceLevelsScreen(),
                            ),
                          );
                        };

                        return _experienceCard(
                          context: context,
                          image: exp['image']!,
                          title: exp['title']!,
                          subtitle: exp['subtitle']!,
                          onPressed: navigateToScreen,
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

  // 🔹 Experience Card widget (add context param for sizing)
  Widget _experienceCard({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double titleFontSize = screenWidth <= 350 ? 22 : 28;

  return GestureDetector(
    onTap: onPressed,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
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
          Center(
                      child: Text(
                      subtitle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        height: 1.2,
                      ),
                    ),
                    )
        ],
      ),
    ),
  );
  }
}
