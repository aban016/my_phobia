import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/user/therapist_details.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150), // Space for top bar
                Column(
                  children: [
            // 🔹 Description Text
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 15),
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
                  double aspectRatio = screenWidth < 340 ? 0.56 : 0.77;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
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

            const SizedBox(height: 20),

                  ],
                ),
              ],
            ),
          ),
          // Top bar positioned over scrolling content
          CustomTopBar(
            title: "Virtual Therapy",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
        ],
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
        const SizedBox(height: 20),
        
        // 🔹 CircleAvatar centered
        ProfilePicture(
          imagePath: 'assets/images/user-pfp.png',
          size: 64,
          borderWidth: 3,
        ),

        const SizedBox(height: 10), 

        Text(
          specialization,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
        ),

        const SizedBox(height: 8),

        // 🔹 Name with verified checkmark
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF320F7D),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF29CA25),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // 🔹 Star rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4, (index) => const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            )),
            const Icon(
              Icons.star_half,
              size: 14,
              color: Colors.amber,
            ),
            const SizedBox(width: 4),
            Text(
              rating,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
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


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: double.infinity,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFF5A626),
                  Color(0xFFEE3A8E),
                  Color(0xFF8944CD),
                  Color(0xFF5222E8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TherapistDetails(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                "Details",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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

