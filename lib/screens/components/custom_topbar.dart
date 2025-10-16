import 'dart:ui';
import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack; 
  final double height;
  final String? backgroundImage;
  final bool showMenuIcon;
  final bool showBellIcon;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBellTap;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomTopBar({
    super.key,
    required this.title,
    this.onBack,
    this.height = 140,
    this.backgroundImage,
    this.showMenuIcon = false,
    this.showBellIcon = false,
    this.onMenuTap,
    this.onBellTap,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: backgroundImage != null
                ? DecorationImage(
                    image: AssetImage(backgroundImage!),
                    fit: BoxFit.fitWidth,
                  )
                : null,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),

        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEE3A8D).withOpacity(0.9),
                Color(0xFFEE3A8D).withOpacity(0.6),
                Color(0xFF320F7D).withOpacity(0.6),
                Color(0xFF320F7D).withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),

        // 🔹 Content (Icons + Center Title)
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 20),
            child: Stack(
              alignment: Alignment.center,
              children: _buildStackChildren(context),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildStackChildren(BuildContext context) {
    List<Widget> children = [
      // Left Icon (Menu or Back)
      Align(
        alignment: Alignment.centerLeft,
        child: showMenuIcon
            ? GestureDetector(
                onTap: onMenuTap ?? () {
                  if (scaffoldKey != null) {
                    scaffoldKey!.currentState?.openDrawer();
                  } else {
                    try {
                      Scaffold.of(context).openDrawer();
                    } catch (e) {
                      // If the above fails, try to find the Scaffold in the widget tree
                      final scaffoldState = context.findAncestorStateOfType<ScaffoldState>();
                      scaffoldState?.openDrawer();
                    }
                  }
                },
                child: _blurCircleIcon("assets/images/icons/menubar.png"),
              )
            : onBack != null
                ? GestureDetector(
                    onTap: onBack,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 4), 
                        Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
      ),

      // Title
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    ];

    // Add Right Icon (Bell) if needed
    if (showBellIcon) {
      children.add(
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: onBellTap,
            child: _blurCircleIcon("assets/images/icons/bell.png"),
          ),
        ),
      );
    }

    return children;
  }

  // 🔹 Blur Circle Icon (same design as Home screen)
  Widget _blurCircleIcon(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              imagePath,
              color: Colors.white,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
