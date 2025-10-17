import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:my_phobia/screens/components/bordered_button.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({super.key});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Appointments Details",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Patient Information
                  _buildPatientInfo(),
                  
                  const SizedBox(height: 30),
                  
                  // About Section
                  _buildAboutSection(),
                  
                  const SizedBox(height: 30),
                  
                  // Timing Section
                  _buildTimingSection(),
                  
                  const SizedBox(height: 40),
                  
                  // Action Buttons
                  _buildActionButtons(),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Patient Information
  Widget _buildPatientInfo() {
    return Row(
      children: [
        // Patient Image
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFEE3A8E), width: 2),
            boxShadow: [
              BoxShadow(
                color: Color(0x7DE91E62),
                blurRadius: 0,
                spreadRadius: 3,
                blurStyle: BlurStyle.outer,
              ),
            ]
          ),
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/user-pfp.png'),
          ),
        ),
        const SizedBox(width: 16),
        // Patient Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "David Warren",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Therapy Patient",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // About Section
  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: TextStyle(
             fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF777777),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // Timing Section
  Widget _buildTimingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Timing",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildTimingBadge("Today, September 2"),
            const SizedBox(width: 12),
            _buildTimingBadge("10:00 - 11:00 AM"),
          ],
        ),
      ],
    );
  }

  // Timing Badge
  Widget _buildTimingBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFFF5A626),
              Color(0xFFEE3A8E),
              Color(0xFF8944CD),
              Color(0xFF5222E8),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          blendMode: BlendMode.srcIn,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white, // gets overridden by ShaderMask
            ),
          ),
        ),
      ),
    );
  }

  // Action Buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        // Edit Appointment Button (Gradient)
        GradientButton(
          text: "EDIT APPOINTMENT",
          onPressed: () {
            Navigator.pushNamed(context, '/edit_appointment');
          },
        ),
        
        const SizedBox(height: 16),
        
        // Cancel Appointment Button (Bordered)
        BorderedButton(
          text: "Cancel Appointment",
          onPressed: () {
            _showCancelConfirmation();
          },
        ),
        
        const SizedBox(height: 16),
        
        // Chat With Patient Button (Bordered)
        BorderedButton(
          text: "Chat With Patient",
          onPressed: () {
            // Handle chat with patient
          },
        ),
      ],
    );
  }


  // Show Cancel Confirmation
  void _showCancelConfirmation() {
    PopupHelper.showConfirmation(
      context: context,
      title: "Appointment Cancel",
      message: "Are you sure you want to cancel appointment?",
      confirmText: "Yes",
      cancelText: "No",
      onConfirm: () {
        Navigator.pushNamed(context, '/reason_screen');
      },
      onCancel: () {
        // Just close the popup, no additional action needed
      },
    );
  }
}
