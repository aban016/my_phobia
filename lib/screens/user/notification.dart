import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/bordered_button.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class NotificationScreen extends StatelessWidget {
  final bool isTherapist;
  
  const NotificationScreen({
    super.key,
    this.isTherapist = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark gray background
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
                    
                    // Today Section
                    const Text(
                      "Today",
                      style: TextStyle(
                        color: Color(0xFF6A1B9A),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Today's Notifications
                    _buildNotificationCard(
                      title: "Lorem Ipsum dolor sit amet",
                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui nibh, vestibulum nec eleifend et,",
                      time: "02:50 AM",
                      showButtons: isTherapist,
                    ),
                    ...List.generate(3, (index) => _buildNotificationCard(
                      title: "Lorem Ipsum dolor sit amet",
                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui nibh, vestibulum nec eleifend et,",
                      time: "02:50 AM",
                      showButtons: false,
                    )),
                    
                    const SizedBox(height: 32),
                    
                    // Yesterday Section
                    const Text(
                      "Yesterday",
                      style: TextStyle(
                        color: Color(0xFF6A1B9A),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Yesterday's Notifications
                    ...List.generate(2, (index) => _buildNotificationCard(
                      title: "Lorem Ipsum dolor sit amet",
                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui nibh, vestibulum nec eleifend et,",
                      time: "02:50 AM",
                      showButtons: false,
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
    bool showButtons = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Color(0xFF757575),
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
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              // Buttons (only for first card)
              if (showButtons) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Accept Request Button
                    Expanded(
                      child: GradientButton(
                        text: "Accept Request",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Cancel Request Button
                    Expanded(
                      child: BorderedButton(text: "Cancel Request", onPressed: () {})
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
