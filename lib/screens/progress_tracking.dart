import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class ProgressTracking extends StatefulWidget {
  const ProgressTracking({super.key});

  @override
  State<ProgressTracking> createState() => _ProgressTrackingState();
}

class _ProgressTrackingState extends State<ProgressTracking> {
  // Dynamic values for pie charts
  List<Map<String, dynamic>> growthData = [
    {'label': 'Mental Health', 'value': 54, 'color': const Color(0xFF320F7D)},
    {'label': 'Mindset', 'value': 67, 'color': const Color(0xFF320F7D)},
    {'label': 'Self Awareness', 'value': 54, 'color': const Color(0xFF320F7D)},
    {'label': 'Relationships', 'value': 54, 'color': const Color(0xFF320F7D)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(
          title: "Progress Tracking",
          backgroundImage: "assets/images/home.png",
          showMenuIcon: true,
          showBellIcon: true,
        ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
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
                  
                  // Pie Charts Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final data = growthData[index];
                      final value = data['value'] as int;
                      final remaining = 100 - value;
                      
                      return GestureDetector(
                        onTap: () => _showValueDialog(index),
                        child: Column(
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
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$value%",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "$remaining%",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Label
                            Text(
                              data['label'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF320F7D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Mood Tracker Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mood Tracker",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF320F7D),
                        ),
                      ),
                      const Text(
                        "Dec 16 - Dec 22, 2024",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Mood Tracker Chart
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF320F7D).withOpacity(0.3),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CustomPaint(
                      painter: MoodTrackerPainter(),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      );
  }

  void _showValueDialog(int index) {
    final data = growthData[index];
    final currentValue = data['value'] as int;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update ${data['label']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Current value: $currentValue%'),
            const SizedBox(height: 20),
            Slider(
              value: currentValue.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: '${currentValue.toInt()}%',
              onChanged: (value) {
                setState(() {
                  growthData[index]['value'] = value.toInt();
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
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
      ..color = const Color(0xFFFF6B35)
      ..style = PaintingStyle.fill;
    
    // Calculate angles
    final mainAngle = (value / 100) * 360 * (3.14159 / 180);
    final remainingAngle = ((100 - value) / 100) * 360 * (3.14159 / 180);
    
    // Draw main segment
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * (3.14159 / 180), // Start from top
      mainAngle,
      true,
      mainPaint,
    );
    
    // Draw remaining segment
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      (mainAngle - 90 * (3.14159 / 180)), // Continue from main segment
      remainingAngle,
      true,
      remainingPaint,
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MoodTrackerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF320F7D)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    
    final fillPaint = Paint()
      ..color = const Color(0xFF320F7D).withOpacity(0.2)
      ..style = PaintingStyle.fill;
    
    // Exact mood data points from image (0-9 scale)
    final List<Offset> points = [
      Offset(0, size.height * 0.56), // Day 1: Mood 4
      Offset(size.width * 0.125, size.height * 0.33), // Day 2: Mood 6
      Offset(size.width * 0.25, size.height * 0.06), // Day 3: Mood 8.5
      Offset(size.width * 0.375, size.height * 0.44), // Day 4: Mood 5
      Offset(size.width * 0.5, size.height * 0.67), // Day 5: Mood 3
      Offset(size.width * 0.625, size.height * 0.44), // Day 6: Mood 5
      Offset(size.width * 0.75, size.height * 0.89), // Day 7: Mood 1
      Offset(size.width * 0.875, size.height * 0.22), // Day 8: Mood 7
      Offset(size.width, size.height * 0.17), // Day 9: Mood 7.5
    ];
    
    // Draw Y-axis labels (0-9)
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    for (int i = 0; i <= 9; i++) {
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-15, (size.height / 9) * i - 5),
      );
    }
    
    // Draw X-axis labels (1-9)
    for (int i = 1; i <= 9; i++) {
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset((size.width / 9) * i - 5, size.height + 10),
      );
    }
    
    // Draw grid lines (orange dotted)
    final gridPaint = Paint()
      ..color = const Color(0xFFFF6B35).withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    // Horizontal grid lines
    for (int i = 0; i <= 9; i++) {
      final y = (size.height / 9) * i;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
    
    // Vertical grid lines
    for (int i = 0; i <= 9; i++) {
      final x = (size.width / 9) * i;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }
    
    // Draw filled area under the line
    final path = Path();
    path.moveTo(points[0].dx, size.height);
    for (final point in points) {
      path.lineTo(point.dx, point.dy);
    }
    path.lineTo(points.last.dx, size.height);
    path.close();
    canvas.drawPath(path, fillPaint);
    
    // Draw the curved line
    final curvedPath = Path();
    curvedPath.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      final currentPoint = points[i];
      final previousPoint = points[i - 1];
      final controlPoint1 = Offset(
        previousPoint.dx + (currentPoint.dx - previousPoint.dx) / 3,
        previousPoint.dy,
      );
      final controlPoint2 = Offset(
        currentPoint.dx - (currentPoint.dx - previousPoint.dx) / 3,
        currentPoint.dy,
      );
      curvedPath.cubicTo(
        controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        currentPoint.dx, currentPoint.dy,
      );
    }
    canvas.drawPath(curvedPath, paint);
    
    // Draw data points (red circles)
    final pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    
    for (final point in points) {
      canvas.drawCircle(point, 4, pointPaint);
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
