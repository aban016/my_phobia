import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      body: Column(
        children: [
          // Custom Top Bar with gradient background
          CustomTopBar(
            title: "Notification",
            backgroundImage: "assets/images/home.png",
            onBack: () {
              Navigator.pop(context);
            },
          ),
          
          // Main Content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
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
                    
                    // Today Section
                    const Text(
                      "Today",
                      style: TextStyle(
                        color: Color(0xFF320F7D),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Today's Notifications
                    ...List.generate(4, (index) => _buildNotificationCard(
                      title: "Lorem Ipsum dolor sit amet",
                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui nibh, vestibulum nec eleifend et,",
                      time: "02:50 AM",
                      profileImage: "assets/images/user-pfp.png",
                    )),
                    
                    const SizedBox(height: 32),
                    
                    // Yesterday Section
                    const Text(
                      "Yesterday",
                      style: TextStyle(
                        color: Color(0xFF320F7D),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Yesterday's Notifications
                    ...List.generate(3, (index) => _buildNotificationCard(
                      title: "Lorem Ipsum dolor sit amet",
                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui nibh, vestibulum nec eleifend et,",
                      time: "02:50 AM",
                      profileImage: "assets/images/user-pfp.png",
                    )),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required String time,
    required String profileImage,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFEE3A8E),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x7DE91E62),
                    blurRadius: 0,
                    spreadRadius: 4,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
