import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/booked_sessions.dart';

class VirtualTherapyScreen extends StatelessWidget {
  const VirtualTherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> therapists = List.generate(6, (index) {
      return {
        "name": "David Warren",
        "specialization": "Therapeutic Trainings",
        "image":
            "assets/images/vt-u-bg.png",
        "rating": "4.9",
      };
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTopBar(
              title: "Virtual Therapy",
              backgroundImage: "assets/images/home.png",
              onBack: () => Navigator.pop(context),
            ),
            const SizedBox(height: 10),

            // 🔹 Description Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Book Therapy Sessions, Meet Phobia Therapist, Nearby Professionals",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),

            // 🔹 Therapist Cards Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double aspectRatio = screenWidth < 340 ? 0.56 : 0.66;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: therapists.length,
                    itemBuilder: (context, index) {
                      final therapist = therapists[index];
                      return _therapistCard(
                        context: context,
                        image: therapist["image"],
                        name: therapist["name"],
                        specialization: therapist["specialization"],
                        rating: therapist["rating"],
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

 Widget _therapistCard({
  required BuildContext context,
  required String image,
  required String name,
  required String specialization,
  required String rating,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 🔹 Stack for cover + overlapping circle
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 Gradient Overlay
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 25, 18, 109).withOpacity(0.2),
                      const Color(0xFF5244F3).withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // 🔹 CircleAvatar overlapping
            Positioned(
              bottom: -30, // half overlap
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(3), 
                  decoration: const BoxDecoration(
                    color: Colors.pink, 
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x7DE91E62),
                        blurRadius: 0,
                        spreadRadius: 4,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/user-pfp.png'),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40), 

        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF320F7D),
          ),
        ),
        Text(
          specialization,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
        ),

        const SizedBox(height: 8),

        // 🔹 Verified + Rating badges
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF29CA25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Verified",
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFFFE55A),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating ratings",
                    style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),

        const Spacer(),

        // 🔹 Details button
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color(0xFF5244F3),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        //     ),
        //     child: const Text(
        //       "DETAILS",
        //       style: TextStyle(
        //         fontSize: 12,
        //         fontWeight: FontWeight.w500,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),


        SizedBox(
            width: 150,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookedSessionsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Ink(
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
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "DETAILS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
            ),
          ),

        SizedBox(height: 10,),

      ],
    ),
  );
}



}
