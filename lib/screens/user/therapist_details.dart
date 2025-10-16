import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/daily_thought_card.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class TherapistDetails extends StatelessWidget {
  const TherapistDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Therapist Details", 
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  DailyThoughtCard(screenWidth: screenWidth, marginHorizontal: 0),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Therapist Image
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFEE3A8E), width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/images/user-pfp.png'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Therapist Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  child: Text(
                                    "David Warren",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Therapeutic Trainings",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Therapist quick info row as shown in the attached image
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoItem(
                          icon: Icons.inventory_2_outlined,
                          label: "Verified",
                          value: "",
                        ),
                        _VerticalDivider(),
                        _InfoItem(
                          icon: Icons.inventory_2_outlined,
                          label: "Rating",
                          value: "4.5",
                        ),
                        _VerticalDivider(),
                        _InfoItem(
                          icon: Icons.inventory_2_outlined,
                          label: "per hour",
                          value: "\$35.00",
                        ),
                        _VerticalDivider(),
                        _InfoItem(
                          icon: Icons.account_box_outlined,
                          label: "Reviews",
                          value: "31",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // About the therapist
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About the therapist",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF320F7D),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "David Warren is a licensed therapist with over 10 years of experience. He specializes in cognitive-behavioral therapy and has helped thousands of clients overcome their anxiety and depression.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 20),

                 Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF320F7D),
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),

                  // Reviews List
                  Column(
                    children: [
                      // First Review
                      _ReviewCard(
                        reviewerName: "David Warren",
                        reviewerTitle: "Therapeutic Trainings",
                        rating: 5.0,
                        reviewText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Second Review
                      _ReviewCard(
                        reviewerName: "Sarah Johnson",
                        reviewerTitle: "Mental Health Counselor",
                        rating: 4.5,
                        reviewText: "Excellent therapist! David helped me overcome my anxiety through cognitive behavioral therapy. Highly recommended for anyone struggling with mental health issues.",
                      ),
                      
                      const SizedBox(height: 20),
                    ],
                  ),

                  const SizedBox(height: 20),

                   GradientButton(
                          text: "Book Now",
                          onPressed: () {
                            Navigator.pushNamed(context, '/booking_details');
                          },
                        ),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final bool hasValue = value.isNotEmpty;
    const double totalHeight = 74;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
      child: SizedBox(
        height: totalHeight,
        width: 68, 
        child: Stack(
          children: [
            // Title/label always fixed at the bottom center
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF320F7D),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned.fill(
              bottom: 24, 
              child: Align(
                alignment: Alignment.center,
                child: hasValue
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 24, color: Colors.black),
                        const SizedBox(height: 3),
                        Text(
                          value,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Icon(icon, size: 26, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 45,
      color: Colors.grey.shade200,
      margin: const EdgeInsets.symmetric(horizontal: 2),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String reviewerTitle;
  final double rating;
  final String reviewText;

  const _ReviewCard({
    required this.reviewerName,
    required this.reviewerTitle,
    required this.rating,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer Info Row
          Row(
            children: [
              // Reviewer Image
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFEE3A8E), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/user-pfp.png'),
                ),
              ),
              const SizedBox(width: 16),
              // Reviewer Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          reviewerName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      reviewerTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Review Text
          Text(
            reviewText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 12),

          // Stars Row
          Row(
            children: [
              ...List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 14,
                    height: 14,
                  ),
                );
              }),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}