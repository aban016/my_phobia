import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class HelpFeedback extends StatelessWidget {
  const HelpFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Help & Feedback",
            backgroundImage: "assets/images/home.png",
            onBack: () {
              Navigator.pop(context);
            },
          ),
          
          // Main Content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Dummy text content
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Social Links Section
                    const Text(
                      "Social Links",
                      style: TextStyle(
                        color: Color(0xFF320F7D),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Social Links Row
                    Row(
                      children: [
                        _buildSocialLink(Icons.apple, () {}),
                    const SizedBox(width: 10),
                        _buildSocialLink(Icons.g_mobiledata, () {}),
                    const SizedBox(width: 10),
                        _buildSocialLink(Icons.facebook, () {}),
                    const SizedBox(width: 10),
                        _buildSocialLink(Icons.camera_alt, () {}),
                      ],
                    ),
                    
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: GradientButton(
              text: "Chat With Customer Support",
              onPressed: () {
                Navigator.pushNamed(context, '/customer_support');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLink(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.5,
            color: Colors.transparent,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
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
          padding: const EdgeInsets.all(1.5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.5),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 16,
                color: const Color(0xFF320F7D),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
