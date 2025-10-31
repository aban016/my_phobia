import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:my_phobia/screens/user/bottom_nav_wrapper.dart';
import 'package:my_phobia/screens/user/booking_details.dart';
import 'package:my_phobia/screens/user/payment_methods.dart';
import 'package:my_phobia/screens/user/add_new_card.dart';
import 'package:my_phobia/screens/user/booked_sessions.dart';
import 'package:my_phobia/screens/user/settings.dart';
import 'package:my_phobia/screens/user/terms.dart';
import 'package:my_phobia/screens/user/policy.dart';
import 'package:my_phobia/screens/user/about.dart';
import 'package:my_phobia/screens/user/change_password.dart';
import 'package:my_phobia/screens/user/edit_profile.dart';
import 'package:my_phobia/screens/user/help_feedback.dart';
import 'package:my_phobia/screens/inbox.dart';
import 'package:my_phobia/screens/chat.dart';
import 'package:my_phobia/screens/user/customer_support.dart';
import 'package:my_phobia/screens/forgot_password.dart';
import 'package:my_phobia/screens/otp.dart';
import 'package:my_phobia/screens/reset_password.dart';
import 'package:my_phobia/screens/splash.dart';
import 'package:my_phobia/screens/login.dart';
import 'package:my_phobia/screens/role_selection.dart';
import 'package:my_phobia/screens/user/notification.dart';
import 'package:my_phobia/screens/therapist/create_profile.dart';
import 'package:my_phobia/screens/therapist/edit_profile.dart';
import 'package:my_phobia/screens/therapist/schedule_appointment.dart';
import 'package:my_phobia/screens/therapist/upcoming_appointments.dart';
import 'package:my_phobia/screens/therapist/appointment_details.dart';
import 'package:my_phobia/screens/therapist/reason_screen.dart';
import 'package:my_phobia/screens/therapist/edit_appointment.dart';
import 'package:my_phobia/screens/therapist/patient_progress_tracking.dart';
import 'package:my_phobia/screens/therapist/inbox.dart';
import 'package:my_phobia/screens/therapist/appointment_management.dart';
import 'package:my_phobia/screens/therapist/bottom_nav_wrapper.dart';
import 'package:my_phobia/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar to light (white icons) for all screens
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // iOS
        statusBarBrightness: Brightness.dark, // Android
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'My Phobia',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Ensure status bar is light for all screens
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light, // iOS
            statusBarBrightness: Brightness.dark, // Android
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
        return child!;
      },
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
      home: const AppInitializer(),
      routes: {
        '/login': (context) => const Login(),
        '/role_selection': (context) => const RoleSelectionScreen(),
        '/home': (context) => const BottomNavWrapper(),
        '/booking_details': (context) => const BookingDetails(),
        '/payment_methods': (context) => const PaymentMethods(),
        '/add_new_card': (context) => const AddNewCard(),
        '/booked_sessions': (context) => const BookedSessionsScreen(),
        '/settings': (context) => const Settings(),
        '/terms': (context) => const TermsOfServices(),
        '/policy': (context) => const PrivacyPolicy(),
        '/about': (context) => const AboutUs(),
        '/change_password': (context) => const ChangePassword(),
        '/edit_profile': (context) => const EditProfile(),
        '/help_feedback': (context) => const HelpFeedback(),
        '/inbox': (context) => const Inbox(),
        '/chat': (context) => const Chat(),
        '/customer_support': (context) => const CustomerSupport(),
        '/forgot_password': (context) => const ForgotPassword(),
        '/otp': (context) => const OTP(),
        '/reset_password': (context) => const ResetPassword(),
        '/splash': (context) => const Splash(),
        '/notification': (context) => const NotificationScreen(),
        '/create_profile': (context) => const CreateProfile(),
        '/therapist_edit_profile': (context) => const TherapistEditProfile(),
        '/therapist_home': (context) => const TherapistBottomNavWrapper(),
        '/schedule_appointment': (context) => const ScheduleAppointment(),
        '/upcoming_appointments': (context) => const UpcomingAppointments(),
        '/appointment_details': (context) => const AppointmentDetails(),
        '/reason_screen': (context) => const ReasonScreen(),
        '/edit_appointment': (context) => const EditAppointment(),
        '/patient_progress_tracking': (context) => const PatientProgressTracking(),
        '/therapist_inbox': (context) => const TherapistInbox(),
        '/appointment_management': (context) => const AppointmentManagement(),
        '/onboarding': (context) => const OnboardingScreen(),
      },
    );
  }
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool _isLoading = true;
  bool _showOnboarding = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
    
    setState(() {
      _showOnboarding = !onboardingCompleted;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Splash();
    }
    
    if (_showOnboarding) {
      return const OnboardingScreen();
    }
    
    return const Splash();
  }
}
