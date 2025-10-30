import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class TherapistEditProfile extends StatefulWidget {
  const TherapistEditProfile({super.key});

  @override
  State<TherapistEditProfile> createState() => _TherapistEditProfileState();
}

class _TherapistEditProfileState extends State<TherapistEditProfile> {
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
  void initState() {
    super.initState();
    // Pre-populate with existing data
    _yearsOfExperienceController.text = "5";
    _qualificationController.text = "Masters in Psychology";
    _pricePerHourController.text = "50";
    _setDaysController.text = "Monday - Friday";
    _availabilityControllers[0].text = "9:00 AM - 12:00 PM";
    _availabilityControllers[1].text = "2:00 PM - 5:00 PM";
  }

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

      if (result != null && result.files.single.path != null) {
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

      if (result != null && result.files.single.path != null) {
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

  Future<void> _showTimePickerDialog(int index) async {
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    // Show start time picker
    startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color(0xFFEE3A8E),
              onPrimary: Colors.white,
              onSurface: Colors.black,
              surface: Colors.white,
              onBackground: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (startTime != null) {
      // Show end time picker
      endTime = await showTimePicker(
        context: context,
        initialTime: startTime,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: const Color(0xFFEE3A8E),
                onPrimary: Colors.white,
                onSurface: Colors.black,
                surface: Colors.white,
                onBackground: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
      );

      if (endTime != null) {
        setState(() {
          final startHour = startTime!.hour > 12 ? startTime.hour - 12 : startTime.hour == 0 ? 12 : startTime.hour;
          final startMinute = startTime.minute.toString().padLeft(2, '0');
          final startAmPm = startTime.hour >= 12 ? 'PM' : 'AM';
          
          final endHour = endTime!.hour > 12 ? endTime.hour - 12 : endTime.hour == 0 ? 12 : endTime.hour;
          final endMinute = endTime.minute.toString().padLeft(2, '0');
          final endAmPm = endTime.hour >= 12 ? 'PM' : 'AM';
          
          _availabilityControllers[index].text = "$startHour:$startMinute $startAmPm - $endHour:$endMinute $endAmPm";
        });
      }
    }
  }

  void _updateProfile() {
    PopupHelper.showSuccess(
      context: context,
      title: "Success!",
      message: "Your profile has been updated successfully!",
      buttonText: "Okay",
      onButtonPressed: () {
        Navigator.pop(context);
      },
    );
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
                                        width: 130,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/user-pfp.png',
                                        width: 130,
                                        height: 130,
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
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
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
                    
                    // Years of Experience
                    _buildTextField(
                      controller: _yearsOfExperienceController,
                      label: "Years of Experience",
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Qualification
                    _buildTextField(
                      controller: _qualificationController,
                      label: "Qualification",
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Upload Medical License
                    _buildUploadField(),
                    
                    const SizedBox(height: 30),
                    
                    // Set your price per hour
                    _buildTextField(
                      controller: _pricePerHourController,
                      label: "Set your price per hour",
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Set your days
                    _buildTextField(
                      controller: _setDaysController,
                      label: "Set your days",
                      suffixIcon: Icons.calendar_today,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Availability Hours Section
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Availability Hours",
                        style: TextStyle(
                          color: Color(0xFF320F7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Availability Hours Grid
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
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
                            _buildAvailabilityField(
                              controller: _availabilityControllers[index],
                              suffixIcon: Icons.access_time,
                              onTap: () => _showTimePickerDialog(index),
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
                    
                    const SizedBox(height: 40),
                    
                    // Update Profile Button
                    GradientButton(
                      text: "UPDATE PROFILE",
                      onPressed: _updateProfile,
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
    IconData? suffixIcon,
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter $label",
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
                    suffixIcon: suffixIcon != null
                        ? Icon(
                            suffixIcon,
                            color: Colors.grey[600],
                            size: 20,
                          )
                        : null,
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
                    color: Color(0xFFEE3A8D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              painter: _DashedGradientBorderPainter(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF5A626),
                    Color(0xFFEE3A8E),
                    Color(0xFF8944CD),
                    Color(0xFF5222E8),
                  ],
                ),
                strokeWidth: 2,
                dashWidth: 8,
                dashSpace: 6,
              ),
              child: GestureDetector(
                onTap: _pickMedicalLicense,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.upload,
                        color: Color(0xFFEE3A8D),
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _medicalLicenseFile != null
                            ? "Medical License Uploaded"
                            : "Upload Medical License",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Label positioned above the field
            Positioned(
              left: 20,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Medical License",
                  style: TextStyle(
                    color: Color(0xFFEE3A8D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvailabilityField({
    required TextEditingController controller,
    IconData? suffixIcon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    controller.text.isEmpty ? "Availability Hours" : controller.text,
                    style: TextStyle(
                      color: controller.text.isEmpty ? Colors.grey[400] : Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ),
                if (suffixIcon != null)
                  Icon(
                    suffixIcon,
                    color: Colors.grey[600],
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedGradientBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final Gradient gradient;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  _DashedGradientBorderPainter({
    required this.borderRadius,
    required this.gradient,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final borderRad = borderRadius.topLeft.x;
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRad),
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Path around rounded rectangle
    final Path borderPath = Path()..addRRect(rrect);

    final pathMetricIterator = borderPath.computeMetrics().iterator;
    while (pathMetricIterator.moveNext()) {
      final metric = pathMetricIterator.current;
      double distance = 0.0;
      while (distance < metric.length) {
        final double len = (distance + dashWidth) < metric.length
            ? dashWidth
            : metric.length - distance;
        final Path segment = metric.extractPath(distance, distance + len);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedGradientBorderPainter oldDelegate) =>
      oldDelegate.borderRadius != borderRadius ||
      oldDelegate.gradient != gradient ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashSpace != dashSpace;
}

