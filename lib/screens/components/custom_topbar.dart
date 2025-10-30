import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_phobia/screens/user/notification.dart';

class CustomTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack; 
  final double height;
  final String? backgroundImage;
  final bool showMenuIcon;
  final bool showBellIcon;
  final bool isBottomNav;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBellTap;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool isTherapist;

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
    this.isBottomNav = false,
    this.isTherapist = false,
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 0),
              child: Stack(
                alignment: Alignment.center,
                children: _buildStackChildren(context),
              ),
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
                    child: _blurCircleIconFromIcon(Icons.arrow_back),
                  )
                : const SizedBox.shrink(),
      ),

      // Title
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: isBottomNav ? 32 : 18,
          fontWeight: isBottomNav ? FontWeight.w400 : FontWeight.w700,
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
            onTap: onBellTap ?? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(isTherapist: isTherapist),
                ),
              );
            },
            child: _blurCircleIcon("assets/images/icons/bell.png"),
          ),
        ),
      );
    }

    return children;
  }

  // 🔹 Blur Circle Icon from IconData (for back button)
  Widget _blurCircleIconFromIcon(IconData icon) {
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
          child: Center(
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
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
