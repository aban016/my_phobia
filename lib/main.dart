import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_phobia/screens/bottom_nav_wrapper.dart';
import 'package:my_phobia/screens/booking_details.dart';
import 'package:my_phobia/screens/payment_methods.dart';
import 'package:my_phobia/screens/add_new_card.dart';
import 'package:my_phobia/screens/settings.dart';
import 'package:my_phobia/screens/terms.dart';
import 'package:my_phobia/screens/policy.dart';
import 'package:my_phobia/screens/about.dart';
import 'package:my_phobia/screens/change_password.dart';
import 'package:my_phobia/screens/help_feedback.dart';
import 'package:my_phobia/screens/inbox.dart';
import 'package:my_phobia/screens/chat.dart';
import 'package:my_phobia/screens/customer_support.dart';
import 'package:my_phobia/screens/forgot_password.dart';
import 'package:my_phobia/screens/otp.dart';
import 'package:my_phobia/screens/reset_password.dart';
import 'package:my_phobia/screens/splash.dart';
import 'package:my_phobia/screens/login.dart';
import 'package:my_phobia/screens/notification.dart';

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
        textTheme: ThemeData().textTheme.apply(fontFamily: 'Urbanist'),
        primaryTextTheme: ThemeData().primaryTextTheme.apply(fontFamily: 'Urbanist'),
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: 'Urbanist'),
          ),
        ),
      ),
      home: const Splash(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const BottomNavWrapper(),
        '/booking_details': (context) => const BookingDetails(),
        '/payment_methods': (context) => const PaymentMethods(),
        '/add_new_card': (context) => const AddNewCard(),
        '/settings': (context) => const Settings(),
        '/terms': (context) => const TermsOfServices(),
        '/policy': (context) => const PrivacyPolicy(),
        '/about': (context) => const AboutUs(),
        '/change_password': (context) => const ChangePassword(),
        '/help_feedback': (context) => const HelpFeedback(),
        '/inbox': (context) => const Inbox(),
        '/chat': (context) => const Chat(),
        '/customer_support': (context) => const CustomerSupport(),
        '/forgot_password': (context) => const ForgotPassword(),
        '/otp': (context) => const OTP(),
        '/reset_password': (context) => const ResetPassword(),
        '/splash': (context) => const Splash(),
        '/notification': (context) => const NotificationScreen(),
      },
    );
  }
}
