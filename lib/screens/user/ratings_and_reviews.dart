import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';

class RatingsAndReviewsScreen extends StatelessWidget {
  final String therapistName;
  final List<Map<String, dynamic>> reviews;

  const RatingsAndReviewsScreen({
    super.key,
    required this.therapistName,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Rating & Reviews",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...reviews.map((review) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _ReviewCard(
                      reviewerName: review['name'] ?? 'Unknown',
                      reviewerTitle: review['title'] ?? 'Patient',
                      rating: review['rating'] ?? 4.5,
                      reviewText: review['text'] ?? '',
                    ),
                  )),
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
    return Column(
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
                  Text(
                    reviewerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
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
          style: const TextStyle(
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
    );
  }
}

