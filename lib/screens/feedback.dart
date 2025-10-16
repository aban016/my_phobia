import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Feedback",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          const SizedBox(height: 20),
          const Text(
            "Give a Star",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF320F7D),
            ),
          ),
          const SizedBox(height: 15),
          // Stars
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 37,
                    height: 37,
                  ),
                  Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 37,
                    height: 37,
                  ),
                  Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 37,
                    height: 37,
                  ),
                  Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 37,
                    height: 37,
                  ),
                  Image.asset(
                    "assets/images/icons/feedback_star.png",
                    width: 37,
                    height: 37,
                  ),
                ]),
          ),
          SizedBox(height: 35),
          // Review
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // The main border and text field container
                Container(
                  height: 230,
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
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
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
                      maxLines: null,
                    ),
                  ),
                ),
                // "Write Review" label - above the border
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
                        "Write Review",
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
            ),
          ),
          SizedBox(height: 18),

          // New file upload area with selectable image and dotted + gradient border
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: _pickImage,
              child: CustomDottedGradientBorder(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(colors: [
                  Color(0xFFF5A626),
                  Color(0xFFEE3A8E),
                  Color(0xFF8944CD),
                  Color(0xFF5222E8),
                ]),
                strokeWidth: 2.2,
                dashWidth: 10,
                dashSpace: 6,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  child: _selectedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icons/upload.png", width: 24, height: 24),
                            SizedBox(height: 7),
                            Text(
                              "Upload Media",
                              style: TextStyle(
                                  color: Color(0xFF320F7D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_selectedImage!,
                              width: 70, height: 70, fit: BoxFit.cover),
                        ),
                ),
              ),
            ),
          ),

          SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Show success popup
                  PopupHelper.showSuccess(
                    context: context,
                    title: "Congratulations!",
                    message: "You feedback has been submitted successfully!",
                    buttonText: "Okay",
                    onButtonPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
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
                        color: Colors.white, // white text on gradient
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget for Dotted Gradient Border
class CustomDottedGradientBorder extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Gradient gradient;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const CustomDottedGradientBorder({
    required this.child,
    required this.borderRadius,
    required this.gradient,
    this.strokeWidth = 2,
    this.dashWidth = 8,
    this.dashSpace = 4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedGradientBorderPainter(
        borderRadius: borderRadius,
        gradient: gradient,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

class _DottedGradientBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final Gradient gradient;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  _DottedGradientBorderPainter({
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
  bool shouldRepaint(_DottedGradientBorderPainter oldDelegate) =>
      oldDelegate.borderRadius != borderRadius ||
      oldDelegate.gradient != gradient ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashSpace != dashSpace;
}