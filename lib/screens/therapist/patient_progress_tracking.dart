import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:my_phobia/screens/components/custom_topbar.dart';

class PatientProgressTracking extends StatefulWidget {
  const PatientProgressTracking({super.key});

  @override
  State<PatientProgressTracking> createState() => _PatientProgressTrackingState();
}

class _PatientProgressTrackingState extends State<PatientProgressTracking> {
  
  // Dynamic values for pie charts
  List<Map<String, dynamic>> growthData = [
    {'label': 'Crowded Streets', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Social Gatherings', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Bridges', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Heights', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'Funerals', 'value': 54, 'color': const Color(0xFF6F34DA)},
    {'label': 'On Dates', 'value': 54, 'color': const Color(0xFF6F34DA)},
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
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFEE3A8E), // Pink color
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
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF320F7D),
          ),
        ),
        const SizedBox(height: 10),
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
          itemCount: growthData.length,
          itemBuilder: (context, index) {
            final data = growthData[index];
            final value = data['value'] as int;
            
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
