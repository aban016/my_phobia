import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'dart:io';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  
  String? _fullNameError;
  String? _emailError;
  String? _aboutError;
  
  File? _profileImageFile;

  @override
  void initState() {
    super.initState();
    // Pre-populate with existing user data
    _fullNameController.text = "Lisa Marie";
    _emailController.text = "lisamarie@gmail.com";
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  void _validateFullName(String value) {
    setState(() {
      if (value.isEmpty) {
        _fullNameError = "Full name is required";
      } else {
        _fullNameError = null;
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = "Email is required";
      } else if (!value.contains('@')) {
        _emailError = "Please enter a valid email";
      } else {
        _emailError = null;
      }
    });
  }

  void _validateAbout(String value) {
    setState(() {
      // About is optional, no validation needed
      _aboutError = null;
    });
  }

  bool _isFormValid() {
    return _fullNameController.text.isNotEmpty &&
           _emailController.text.isNotEmpty &&
           _fullNameError == null &&
           _emailError == null &&
           _aboutError == null;
  }

  Future<void> _pickProfileImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _profileImageFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      print('Error picking profile image: $e');
    }
  }

  void _saveProfile() {
    if (_isFormValid()) {
      PopupHelper.showSuccess(
        context: context,
        title: "Congratulations!",
        message: "Your profile has been updated successfully!",
        buttonText: "Okay",
        onButtonPressed: () {
          Navigator.pop(context);
          Navigator.pop(context); // Go back to previous screen
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
            title: "Edit Profile",
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
                    
                    // Profile Picture Section
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFEE3A8E), width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFEE3A8E).withOpacity(0.5),
                                  blurRadius: 0,
                                  spreadRadius: 6,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: _profileImageFile != null
                                    ? Image.file(
                                        _profileImageFile!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/user-pfp.png',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          // Camera Icon
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickProfileImage,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: [
                                        Color(0xFFF38942), // Orange
                                        Color(0xFFB240B3), // Purple
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcIn,
                                  child: const Icon(
                                    Iconsax.camera_copy,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Full Name Field
                    _buildTextField(
                      controller: _fullNameController,
                      label: "Full Name",
                      onChanged: _validateFullName,
                      errorText: _fullNameError,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Email Field
                    _buildTextField(
                      controller: _emailController,
                      label: "Email",
                      onChanged: _validateEmail,
                      errorText: _emailError,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // About Field (multiline)
                    _buildTextField(
                      controller: _aboutController,
                      label: "About",
                      hintText: "Write something about yourself",
                      onChanged: _validateAbout,
                      errorText: _aboutError,
                      maxLines: 5,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Save Button
                    GradientButton(
                      text: "SAVE",
                      onPressed: _isFormValid() ? _saveProfile : null,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required Function(String) onChanged,
    String? errorText,
    String? hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  onChanged: onChanged,
                  maxLines: maxLines,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText ?? "Enter $label",
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
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEE3A8D),
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
}

