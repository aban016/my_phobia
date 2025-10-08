import 'package:flutter/material.dart';
import 'package:my_phobia/screens/login.dart';
import 'package:my_phobia/screens/bottom_nav_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Phobia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'Urbanist',
      ),
      home: const Login(),
      routes: {
        '/home': (context) => const BottomNavWrapper(),
      },
    );
  }
}
