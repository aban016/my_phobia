import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_bottom_nav.dart';
import 'package:my_phobia/screens/home.dart';
import 'package:my_phobia/screens/progress_tracking.dart';
import 'package:my_phobia/screens/holistic_support.dart';
import 'package:my_phobia/screens/components/side_menu.dart';

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const ProgressTracking(),
    const Home(),
    const HolisticSupport(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Home is at index 1, Progress Tracking is at index 0
    final bool isHomeActive = _selectedIndex == 1;
    final bool isProgressTrackingActive = _selectedIndex == 0;
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: isHomeActive ? Color(0xFF090A13) : Colors.white,
      drawer: const SideMenu(),
      drawerScrimColor: Colors.black.withOpacity(0.5),
      body: Container(
        color: isProgressTrackingActive ? Colors.white : null,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
