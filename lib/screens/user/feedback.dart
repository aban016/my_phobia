import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Feedback",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          const SizedBox(height: 20),
          const Text(
            "Give a Star",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF320F7D),
            ),
          ),
          const SizedBox(height: 15),
          // Stars
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStar = index + 1;
                    });
                  },
                  child: Icon(
                    (index + 1) <= selectedStar ? Icons.star : Icons.star_border,
                    size: 40,
                    color: (index + 1) <= selectedStar ? Color(0xFFFF9E00) : Colors.grey[300],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 35),
          // Review
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // The main border and text field container
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF5A626),
                        Color(0xFFEE3A8E),
                        Color(0xFF8944CD),
                        Color(0xFF5222E8),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(1.5),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Description...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8E8E93),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
                // "Write Review" label - above the border
                Positioned(
                  left: 18,
                  top: -10,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text(
                        "Write Review",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFEE3A8E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 35),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Show success popup
                  PopupHelper.showSuccess(
                    context: context,
                    title: "Congratulations!",
                    message: "You feedback has been submitted successfully!",
                    buttonText: "Okay",
                    onButtonPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
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
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // white text on gradient
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}