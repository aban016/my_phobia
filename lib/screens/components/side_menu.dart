import 'package:flutter/material.dart';
import 'package:my_phobia/screens/user/login.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Container(
        height: screenHeight,
        child: Column(
          children: [
          // Header Section with Profile
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 30),
            child: Column(
              children: [
                // Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xFF677081),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Profile Picture
                Container(
                  width: 115,
                  height: 115,
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
                  child: const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/images/user-pfp.png'),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // User Name
                const Text(
                  "Lisa Marie",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF320F7D),
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Username
                const Text(
                  "lisa_marie",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Navigation Menu Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildMenuItem("Home", Icons.home_outlined, () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/home');
                  }),
                  _buildDivider(),
                  
                  _buildMenuItem("Appointment Management", Icons.calendar_today_outlined, () {
                    Navigator.pop(context);
                    // Navigate to appointment management
                  }),
                  _buildDivider(),
                  
                  _buildMenuItem("Chats", Icons.chat_bubble_outline, () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/inbox');
                  }),
                  _buildDivider(),
                  
                  _buildMenuItem("Settings", Icons.settings_outlined, () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  }),
                  _buildDivider(),
                  
                  _buildMenuItem("Help & Feedback", Icons.help_outline, () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/help_feedback');
                  }),
                ],
              ),
            ),
          ),
          
          // Logout Button
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 64, bottom: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Handle logout
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF320F7D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.black87,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(vertical: 0),
    );
  }
}
