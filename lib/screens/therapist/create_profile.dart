import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _yearsOfExperienceController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _pricePerHourController = TextEditingController();
  final TextEditingController _setDaysController = TextEditingController();
  
  final List<TextEditingController> _availabilityControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  File? _medicalLicenseFile;
  File? _profileImageFile;

  @override
  void dispose() {
    _yearsOfExperienceController.dispose();
    _qualificationController.dispose();
    _pricePerHourController.dispose();
    _setDaysController.dispose();
    for (var controller in _availabilityControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickMedicalLicense() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          _medicalLicenseFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<void> _pickProfileImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        setState(() {
          _profileImageFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      print('Error picking profile image: $e');
    }
  }

  void _addMoreTime() {
    setState(() {
      _availabilityControllers.add(TextEditingController());
    });
  }

  void _removeTime(int index) {
    if (_availabilityControllers.length > 1) {
      setState(() {
        _availabilityControllers[index].dispose();
        _availabilityControllers.removeAt(index);
      });
    }
  }

  void _createProfile() {
    Navigator.pushNamed(context, '/therapist_home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                const SizedBox(height: 20),
                
                // Title
                const Text(
                  "Create Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Profile Picture Section
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFEE3A8D), // Pink
                            Color(0xFF8944CD), // Purple
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x7DE91E62),
                            blurRadius: 0,
                            spreadRadius: 4,
                            blurStyle: BlurStyle.outer,
                          )
                        ]
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
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFEE3A8D), // Pink
                                Color(0xFF8944CD), // Purple
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Years of Experience
                _buildInputField(
                  controller: _yearsOfExperienceController,
                  hintText: "Years of Experience",
                ),
                
                const SizedBox(height: 20),
                
                // Qualification
                _buildInputField(
                  controller: _qualificationController,
                  hintText: "Qualification",
                ),
                
                const SizedBox(height: 20),
                
                // Upload Medical License
                _buildUploadField(),
                
                const SizedBox(height: 20),
                
                // Set your price per hour
                _buildInputField(
                  controller: _pricePerHourController,
                  hintText: "Set your price per hour",
                ),
                
                const SizedBox(height: 20),
                
                // Set your days
                _buildInputField(
                  controller: _setDaysController,
                  hintText: "Set your days",
                  suffixIcon: Icons.calendar_today,
                ),
                
                const SizedBox(height: 20),
                
                // Availability Hours Section
                const Text(
                  "Availability Hours",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                // Availability Hours Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: _availabilityControllers.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        _buildInputField(
                          controller: _availabilityControllers[index],
                          hintText: "Availability Hours",
                          suffixIcon: Icons.access_time,
                        ),
                        // Remove button for additional items
                        if (_availabilityControllers.length > 1)
                          Positioned(
                            top: -5,
                            right: -5,
                            child: GestureDetector(
                              onTap: () => _removeTime(index),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                
                const SizedBox(height: 20),
                
                // Add More Time Button (Right aligned, smaller)
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 140,
                    height: 40,
                    child: GradientButton(
                      text: "Add More Time",
                      onPressed: _addMoreTime,
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Create Profile Button
                GradientButton(
                  text: "CREATE PROFILE",
                  onPressed: _createProfile,
                ),
                
                const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    IconData? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF5A626),
            Color(0xFFEE3A8E),
            Color(0xFF8944CD),
            Color(0xFF5222E8),
          ],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        margin: const EdgeInsets.all(2), // Gradient dikhega sirf border ki tarah
        decoration: BoxDecoration(
          color: Color(0xFF090A13), // Field ka background
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF8E8E93), // Light gray
              fontSize: 16,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: Colors.white,
                    size: 20,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildUploadField() {
    return GestureDetector(
      onTap: _pickMedicalLicense,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF5A626),
              Color(0xFFEE3A8E),
              Color(0xFF8944CD),
              Color(0xFF5222E8),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xFF090A13),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(height: 8),
              Text(
                _medicalLicenseFile != null
                    ? "Medical License Uploaded"
                    : "Upload Medical License",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
