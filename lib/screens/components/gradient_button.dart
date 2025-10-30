import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? borderRadius;
  final List<Color>? gradientColors;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height = 56,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = Colors.white,
    this.borderRadius = 50,
    this.gradientColors,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final defaultGradientColors = const [
      Color(0xFFF5A626),
      Color(0xFFEE3A8E),
      Color(0xFF8944CD),
      Color(0xFF5222E8),
    ];

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors ?? defaultGradientColors,
              begin: gradientBegin ?? Alignment.topLeft,
              end: gradientEnd ?? Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
