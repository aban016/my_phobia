import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:my_phobia/screens/components/custom_topbar.dart';

class ProgressTracking extends StatefulWidget {
  const ProgressTracking({super.key});

  @override
  State<ProgressTracking> createState() => _ProgressTrackingState();
}

class _ProgressTrackingState extends State<ProgressTracking> {
  // Static values for pie charts matching the image
  List<Map<String, dynamic>> growthData = [
    {'label': 'Crowded Streets', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Social Gatherings', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Bridges', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Heights', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Funerals', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'On Dates', 'value': 54, 'color': const Color(0xFF6F34DA)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(
          title: "Hi, Tetiana!",
          backgroundImage: "assets/images/home.png",
          showMenuIcon: true,
          showBellIcon: true,
          isBottomNav: true,
        ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Growth Area Section
                  const Text(
                    "Growth Area",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF320F7D),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Pie Charts Grid
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final data = growthData[index];
                      final value = data['value'] as int;
                      // remaining percentage is computed and drawn inside the painter
                      
                      return Column(
                          children: [
                            // Pie Chart
                            Container(
                              width: 120,
                              height: 120,
                              child: CustomPaint(
                                painter: PieChartPainter(
                                  value: value,
                                  color: data['color'] as Color,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Label
                            Text(
                              data['label'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF320F7D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }

}

class PieChartPainter extends CustomPainter {
  final int value;
  final Color color;
  
  PieChartPainter({required this.value, required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // Main segment paint
    final mainPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    // Remaining segment paint (orange)
    final remainingPaint = Paint()
      ..color = const Color(0xFFF5A626)
      ..style = PaintingStyle.fill;
    
    // Calculate angles (radians)
    final mainAngle = (value / 100) * 2 * math.pi;
    final remainingAngle = ((100 - value) / 100) * 2 * math.pi;
    
    // Draw main segment
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      mainAngle,
      true,
      mainPaint,
    );
    
    // Draw remaining segment
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + mainAngle, // Continue from main segment
      remainingAngle,
      true,
      remainingPaint,
    );

    // ---- Draw percentages inside each segment ----
    final mainMidAngle = -math.pi / 2 + (mainAngle / 2);
    final remainingMidAngle = -math.pi / 2 + mainAngle + (remainingAngle / 2);

    final labelRadius = radius * 0.55; // place labels towards the middle

    final mainPos = Offset(
      center.dx + labelRadius * math.cos(mainMidAngle),
      center.dy + labelRadius * math.sin(mainMidAngle),
    );

    final remainingPos = Offset(
      center.dx + labelRadius * math.cos(remainingMidAngle),
      center.dy + labelRadius * math.sin(remainingMidAngle),
    );

    // Main (purple) percentage - white text
    final mainTextPainter = TextPainter(
      text: TextSpan(
        text: '$value%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    mainTextPainter.paint(
      canvas,
      Offset(mainPos.dx - mainTextPainter.width / 2, mainPos.dy - mainTextPainter.height / 2),
    );

    // Remaining (orange) percentage - black text
    final remainingValue = 100 - value;
    final remainingTextPainter = TextPainter(
      text: TextSpan(
        text: '$remainingValue%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    remainingTextPainter.paint(
      canvas,
      Offset(remainingPos.dx - remainingTextPainter.width / 2, remainingPos.dy - remainingTextPainter.height / 2),
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

