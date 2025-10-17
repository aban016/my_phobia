import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class ReasonScreen extends StatefulWidget {
  const ReasonScreen({super.key});

  @override
  State<ReasonScreen> createState() => _ReasonScreenState();
}

class _ReasonScreenState extends State<ReasonScreen> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Reason",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  
                  // Reason Input Field
                  _buildReasonInputField(),
                  
                  const SizedBox(height: 40),
                  
                  // Submit Button
                  _buildSubmitButton(),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reason Input Field (same design as feedback screen)
  Widget _buildReasonInputField() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The main border and text field container
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF5A626),
                Color(0xFFEE3A8E),
                Color(0xFF8944CD),
                Color(0xFF5222E8),
              ],
            ),
          ),
          padding: const EdgeInsets.all(1.5),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              controller: _reasonController,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: "Description...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 16),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8E8E93),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        // "Write reason for cancellation" label - above the border
        Positioned(
          left: 18,
          top: -10,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text(
                "Write reason for cancellation",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFEE3A8E),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Submit Button (same design as feedback screen)
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Show success popup
          PopupHelper.showSuccess(
            context: context,
            title: "Congratulations!",
            message: "Your appointment with david warren is canceled successfully",
            buttonText: "Okay",
            onButtonPressed: () {
              Navigator.pushReplacementNamed(context, '/upcoming_appointments');
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Ink(
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
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "SUBMIT",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
