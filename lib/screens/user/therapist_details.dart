import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';
import 'package:my_phobia/screens/user/ratings_and_reviews.dart';

class TherapistDetails extends StatelessWidget {
  const TherapistDetails({super.key});

  // Sample reviews data
  final List<Map<String, dynamic>> _reviews = const [
    {
      'name': 'David Warren',
      'title': 'Patient',
      'rating': 4.5,
      'text': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard',
    },
    {
      'name': 'Sarah Johnson',
      'title': 'Patient',
      'rating': 4.5,
      'text': 'Excellent therapist! David helped me overcome my anxiety through cognitive behavioral therapy. Highly recommended.',
    },
    {
      'name': 'Michael Brown',
      'title': 'Patient',
      'rating': 5.0,
      'text': 'David is an amazing therapist. Very professional and understanding. Helped me deal with my phobia effectively.',
    },
    {
      'name': 'Emily Davis',
      'title': 'Patient',
      'rating': 4.0,
      'text': 'Great therapeutic approach. Sessions are well-structured and personalized to my needs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                  // Therapist Profile
                  Row(
                      children: [
                        // Therapist Image
                        ProfilePicture(
                          imagePath: 'assets/images/user-pfp.png',
                          size: 55,
                          borderWidth: 2,
                        ),
                        const SizedBox(width: 16),
                        // Therapist Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "David Warren",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
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
                              const SizedBox(height: 2),
                              const Text(
                                "Therapeutic Trainings",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF777777),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  ...List.generate(4, (index) => const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  )),
                                  const Icon(
                                    Icons.star_half,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Hourly Rate
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Hourly Rates",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF777777),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "\$10.00",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                
                  const SizedBox(height: 30),

                  // About the therapist
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Therapist",
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF320F7D),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RatingsAndReviewsScreen(
                                therapistName: 'David Warren',
                                reviews: _reviews,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 10),

                  // Reviews List
                  Column(
                    children: [
                      // First Review
                      _ReviewCard(
                        reviewerName: "David Warren",
                        reviewerTitle: "Patient",
                        rating: 4.5,
                        reviewText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
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
              ProfilePicture(
                imagePath: 'assets/images/user-pfp.png',
                size: 45,
                borderWidth: 2,
              ),
              const SizedBox(width: 12),
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
                            fontSize: 14,
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
                        fontSize: 12,
                        color: Color(0xFF777777),
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF777777),
              height: 1.7,
            ),
          ),

          const SizedBox(height: 12),

          // Stars Row
          Row(
            children: [
              ...List.generate(
                rating.toInt(),
                (index) => const Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amber,
                ),
              ),
              if (rating % 1 != 0)
                const Icon(
                  Icons.star_half,
                  size: 16,
                  color: Colors.amber,
                ),
              const SizedBox(width: 6),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}