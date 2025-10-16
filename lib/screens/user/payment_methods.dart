import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedPaymentMethod = 0; // 0: Visa, 1: Apple Pay, 2: Google Pay

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'Visa',
      'icon': Icons.credit_card,
    },
    {
      'name': 'Apple Pay',
      'icon': Icons.apple,
    },
    {
      'name': 'Google Pay',
      'icon': Icons.g_mobiledata,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Payment Methods",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Payment Options Section
                  Column(
                    children: [
                      for (int index = 0; index < paymentMethods.length; index++)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPaymentMethod = index;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFF5A626),
                                      Color(0xFFEE3A8E),
                                      Color(0xFF8944CD),
                                      Color(0xFF5222E8),
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        paymentMethods[index]['icon'],
                                        size: 24,
                                        color: const Color(0xFFD63D9D),
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        paymentMethods[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFD63D9D),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedPaymentMethod == index
                                              ? const Color(0xFFD63D9D)
                                              : Colors.white,
                                          border: Border.all(
                                            color: const Color(0xFFD63D9D),
                                            width: 2,
                                          ),
                                        ),
                                        child: selectedPaymentMethod == index
                                            ? const Icon(
                                                Icons.check,
                                                size: 12,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Add New Card Section
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_new_card');
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomPaint(
                        painter: _DashedGradientBorderPainter(
                          borderRadius: BorderRadius.circular(20),
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/icons/credit-cards.png", width: 34, height: 34,),
                              const Text(
                                "Add New Card",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFD63D9D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Continue Button
                  GradientButton(
                    text: "Continue",
                    onPressed: () {
                      // Handle continue action
                      Navigator.pushReplacementNamed(context, '/home');
                    },
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
