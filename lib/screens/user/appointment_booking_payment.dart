import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class AppointmentBookingPaymentScreen extends StatefulWidget {
  final String amount;
  
  const AppointmentBookingPaymentScreen({
    super.key,
    required this.amount,
  });

  @override
  State<AppointmentBookingPaymentScreen> createState() => _AppointmentBookingPaymentScreenState();
}

class _AppointmentBookingPaymentScreenState extends State<AppointmentBookingPaymentScreen> {
  List<Map<String, dynamic>> _paymentMethods = [];
  int _selectedCardIndex = -1;

  void _addPaymentMethod(Map<String, dynamic> cardData) {
    setState(() {
      _paymentMethods.add(cardData);
      // Select the newly added card
      _selectedCardIndex = _paymentMethods.length - 1;
    });
  }

  void _selectCard(int index) {
    setState(() {
      _selectedCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar with blurred back icon
            CustomTopBar(
              title: "Appointment Booking Payment",
              onBack: () => Navigator.pop(context),
              backgroundImage: "assets/images/home.png",
            ),

            // Appointment Booking gradient card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                height: 100,
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
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Appointment Booking",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEE3A8D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '\$${widget.amount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Display existing payment methods
            if (_paymentMethods.isNotEmpty) ...[
              ...(_paymentMethods.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> method = entry.value;
                bool isSelected = _selectedCardIndex == index;
                
                return GestureDetector(
                  onTap: () => _selectCard(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              // Card icon
                              Icon(
                                Iconsax.card,
                                size: 40,
                                color: Color(0xFFEE3A8E),
                              ),
                              const SizedBox(width: 16),
                              // Card details
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      method['cardNumber'] ?? '**** **** **** 4569',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      method['accountHolder'] ?? 'Card Holder',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Selected radio button
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? Color(0xFFEE3A8E) : Colors.grey[400]!,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: isSelected
                                      ? Container(
                                          width: 18,
                                          height: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFF5A626),
                                                Color(0xFFEE3A8E),
                                                Color(0xFF8944CD),
                                                Color(0xFF5222E8),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
              const SizedBox(height: 16),
            ],

            // Add Payment Method dashed gradient border box
            GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(context, '/add_new_card');
                if (result != null) {
                  _addPaymentMethod(result as Map<String, dynamic>);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomPaint(
                  painter: _DashedGradientBorderPainter(
                    radius: 16,
                    dashWidth: 6,
                    dashSpace: 6,
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
                  child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.cards_copy, color: Colors.black54),
                        const SizedBox(height: 8),
                        _GradientText(
                          text: "Add Payment Method",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GradientButton(
                text: "Continue",
                onPressed: _paymentMethods.isNotEmpty ? () {
                  PopupHelper.showSuccess(
                    context: context,
                    title: "Congratulations!",
                    message: "Your appointment has been successfully booked with David Warren.",
                    buttonText: "Okay",
                    onButtonPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  );
                } : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Helpers ----

class _DashedGradientBorderPainter extends CustomPainter {
  final double radius;
  final double dashWidth;
  final double dashSpace;
  final Gradient gradient;

  _DashedGradientBorderPainter({
    required this.radius,
    required this.dashWidth,
    required this.dashSpace,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = gradient.createShader(Offset.zero & size);

    final path = Path()..addRRect(rect);
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        final extractPath = metric.extractPath(distance, next);
        canvas.drawPath(extractPath, paint);
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const _GradientText({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Add Payment Method",
      style: TextStyle(color: Color(0xFFEE3A8E), fontSize: 14, fontWeight: FontWeight.w700),
    );
  }
}

