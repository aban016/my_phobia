import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class PatientProgressTracking extends StatefulWidget {
  const PatientProgressTracking({super.key});

  @override
  State<PatientProgressTracking> createState() => _PatientProgressTrackingState();
}

class _PatientProgressTrackingState extends State<PatientProgressTracking> {
  
  // Dynamic values for pie charts
  List<Map<String, dynamic>> growthData = [
    {'label': 'Mental Health', 'value': 54, 'color': const Color(0xFF320F7D)},
    {'label': 'Mindset', 'value': 54, 'color': const Color(0xFF320F7D)},
    {'label': 'Self Awareness', 'value': 54, 'color': const Color(0xFF320F7D)},
    {'label': 'Relationships', 'value': 54, 'color': const Color(0xFF320F7D)},
  ];

  @override
  void dispose() {
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
            title: "David Warren",
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
                  
                  // Patients Info Section
                  _buildPatientsInfoSection(),
                  
                  const SizedBox(height: 20),
                  
                  // About Section
                  _buildAboutSection(),
                  
                  const SizedBox(height: 30),
                  
                  // Timing Section
                  _buildTimingSection(),
                  
                  const SizedBox(height: 30),
                  
                  // Growth Area Section
                  _buildGrowthAreaSection(),
                  
                  const SizedBox(height: 30),
                  
                  // Mood Tracker Section
                  _buildMoodTrackerSection(),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Patients Info Section
  Widget _buildPatientsInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Patients Info",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF320F7D),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Last Therapy",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFD63D9D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "01-01-2024",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF320F7D),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Progress Status",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFD63D9D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "GOOD",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF320F7D),
                  ),
                ),
              ],
            ),
          ],
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
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
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
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTimingBadge("Today, September 2"),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTimingBadge("10:00 - 11:00 AM"),
            ),
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

  // Growth Area Section
  Widget _buildGrowthAreaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Growth Area",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
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
          itemCount: 4,
          itemBuilder: (context, index) {
            final data = growthData[index];
            final value = data['value'] as int;
            final remaining = 100 - value;
            
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
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // Mood Tracker Section
  Widget _buildMoodTrackerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Mood Tracker",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
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
        const SizedBox(height: 16),
        
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
        Offset(0, size.height - (i * size.height / 9) - 5),
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
        Offset((i * size.width / 9) - 5, size.height - 15),
      );
    }
    
    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;
    
    // Horizontal grid lines
    for (int i = 0; i <= 9; i++) {
      canvas.drawLine(
        Offset(0, i * size.height / 9),
        Offset(size.width, i * size.height / 9),
        gridPaint,
      );
    }
    
    // Vertical grid lines
    for (int i = 0; i <= 9; i++) {
      canvas.drawLine(
        Offset(i * size.width / 9, 0),
        Offset(i * size.width / 9, size.height),
        gridPaint,
      );
    }
    
    // Draw filled area under the line
    final path = Path();
    path.moveTo(points.first.dx, size.height);
    for (final point in points) {
      path.lineTo(point.dx, point.dy);
    }
    path.lineTo(points.last.dx, size.height);
    path.close();
    canvas.drawPath(path, fillPaint);
    
    // Draw the line
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
    
    // Draw data points
    final pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    
    for (final point in points) {
      canvas.drawCircle(point, 4, pointPaint);
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
