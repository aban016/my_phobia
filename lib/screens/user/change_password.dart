import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  
  String? _currentPasswordError;
  String? _newPasswordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateCurrentPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _currentPasswordError = "Current password is required";
      } else if (value.length < 6) {
        _currentPasswordError = "Password must be at least 6 characters";
      } else {
        _currentPasswordError = null;
      }
    });
  }

  void _validateNewPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _newPasswordError = "New password is required";
      } else if (value.length < 6) {
        _newPasswordError = "Password must be at least 6 characters";
      } else {
        _newPasswordError = null;
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _confirmPasswordError = "Please confirm your password";
      } else if (value != _newPasswordController.text) {
        _confirmPasswordError = "Passwords do not match";
      } else {
        _confirmPasswordError = null;
      }
    });
  }

  bool _isFormValid() {
    return _currentPasswordController.text.isNotEmpty &&
           _newPasswordController.text.isNotEmpty &&
           _confirmPasswordController.text.isNotEmpty &&
           _currentPasswordError == null &&
           _newPasswordError == null &&
           _confirmPasswordError == null;
  }

  void _changePassword() {
    if (_isFormValid()) {
      PopupHelper.showSuccess(
        context: context,
        title: "Congratulations!",
        message: "Therapy session rescheduled with david warren at 5:30 PM",
        buttonText: "Okay",
        onButtonPressed: () {
          Navigator.pop(context); // Close popup
          Navigator.pushReplacementNamed(context, '/home'); // Redirect to home
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Change Password",
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
                    
                    // Descriptive text
                    const Text(
                      "Please enter your current password to change",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Current Password Field
                    _buildPasswordField(
                      controller: _currentPasswordController,
                      label: "Current Password",
                      isVisible: _isCurrentPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                        });
                      },
                      onChanged: _validateCurrentPassword,
                      errorText: _currentPasswordError,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // New Password Field
                    _buildPasswordField(
                      controller: _newPasswordController,
                      label: "New Password",
                      isVisible: _isNewPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                      onChanged: _validateNewPassword,
                      errorText: _newPasswordError,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Confirm Password Field
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      label: "Confirm New Password",
                      isVisible: _isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                      onChanged: _validateConfirmPassword,
                      errorText: _confirmPasswordError,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Save Button
                    GradientButton(
                      text: "SAVE",
                      onPressed: _isFormValid() ? _changePassword : null,
                    ),
                    
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

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    required Function(String) onChanged,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add top margin to prevent label cutting
        const SizedBox(height: 10),
        
        // Input Field with Stack for label
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                  borderRadius: BorderRadius.circular(28.5),
                ),
                child: TextField(
                  controller: controller,
                  obscureText: !isVisible,
                  onChanged: onChanged,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: _getHintText(label),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[600],
                      ),
                      onPressed: onToggleVisibility,
                    ),
                  ),
                ),
              ),
            ),
            // Label positioned above the field with proper spacing
            Positioned(
              left: 20,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFD63D9D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        
        // Error Text
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }

  String _getHintText(String label) {
    switch (label) {
      case "Current Password":
        return "Enter Existing Password";
      case "New Password":
        return "Enter New Password";
      case "Confirm New Password":
        return "Enter Confirm Password";
      default:
        return "Enter $label";
    }
  }
}
