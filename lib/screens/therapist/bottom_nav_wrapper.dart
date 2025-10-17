import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_bottom_nav.dart';
import 'package:my_phobia/screens/therapist/inbox.dart';
import 'package:my_phobia/screens/therapist/home.dart';
import 'package:my_phobia/screens/therapist/progress_tracking.dart';
import 'package:my_phobia/screens/components/side_menu.dart';

class TherapistBottomNavWrapper extends StatefulWidget {
  const TherapistBottomNavWrapper({super.key});

  @override
  State<TherapistBottomNavWrapper> createState() => _TherapistBottomNavWrapperState();
}

class _TherapistBottomNavWrapperState extends State<TherapistBottomNavWrapper> {
  int _selectedIndex = 1; // Home is selected by default
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> get _pages => [
    ProgressTracking(scaffoldKey: _scaffoldKey),
    HomeScreen(scaffoldKey: _scaffoldKey),
    TherapistInbox(scaffoldKey: _scaffoldKey),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const SideMenu(isTherapist: true),
      drawerScrimColor: Colors.black.withOpacity(0.5),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        isTherapist: true,
      ),
    );
  }
}
