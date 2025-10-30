import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class Settings extends StatefulWidget {
  final bool isTherapist;
  
  const Settings({super.key, this.isTherapist = false});

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
                    icon: Iconsax.notification_bing,
                    title: "Notifications",
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
                    icon: Iconsax.lock_1,
                    title: "Change Password",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/change_password');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Iconsax.user_edit_copy,
                    title: "Edit Profile",
                    isToggle: false,
                    onTap: () {
                      if (widget.isTherapist) {
                        Navigator.pushNamed(context, '/therapist_edit_profile');
                      } else {
                        Navigator.pushNamed(context, '/edit_profile');
                      }
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Iconsax.note_21,
                    title: "Terms Of Services",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/terms');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Iconsax.note_21,
                    title: "Privacy Policy",
                    isToggle: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/policy');
                    },
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildSettingsItem(
                    icon: Iconsax.note_21,
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
    return GestureDetector(
      onTap: onTap,
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
            borderRadius: BorderRadius.circular(11),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Icon(
                  icon,
                  color: const Color(0xFFEE3A8D), 
                  size: 24,
                ),
                
                const SizedBox(width: 16),
                
                // Title
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black87,
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
