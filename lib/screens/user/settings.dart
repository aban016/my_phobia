import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  bool soundsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Settings",
            backgroundImage: "assets/images/home.png",
            onBack: () {
              Navigator.pop(context);
            },
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // General section title
                  Text(
                    "General",
                    style: TextStyle(
                      color: Color(0xFF320F7D),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Settings items
                  _buildSettingsItem(
                    icon: Icons.notifications_outlined,
                    title: "Notifications Management",
                    isToggle: true,
                    toggleValue: notificationsEnabled,
                    onToggle: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Icons.volume_up_outlined,
                    title: "Sounds",
                    isToggle: true,
                    toggleValue: soundsEnabled,
                    onToggle: (value) {
                      setState(() {
                        soundsEnabled = value;
                      });
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Icons.credit_card_outlined,
                    title: "Change Password",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/change_password');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Icons.description_outlined,
                    title: "Terms Of Services",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/terms');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Icons.description_outlined,
                    title: "Privacy Policy",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/policy');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Icons.description_outlined,
                    title: "About Us",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required bool isToggle,
    bool? toggleValue,
    Function(bool)? onToggle,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Icon(
                  icon,
                  color: const Color(0xFFEE3A8D), 
                  size: 37,
                ),
                
                const SizedBox(width: 16),
                
                // Title
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
                // Toggle or Arrow
                if (isToggle)
                  _buildToggleSwitch(toggleValue ?? false, onToggle!)
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleSwitch(bool value, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: value
              ? const LinearGradient(
                  colors: [
                    Color(0xFF320F7D), // Purple
                    Color(0xFFEE3A8D), // Pink
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[400]!,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26,
            height: 26,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
