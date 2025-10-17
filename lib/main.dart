import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_phobia/screens/user/bottom_nav_wrapper.dart';
import 'package:my_phobia/screens/user/booking_details.dart';
import 'package:my_phobia/screens/user/payment_methods.dart';
import 'package:my_phobia/screens/user/add_new_card.dart';
import 'package:my_phobia/screens/user/settings.dart';
import 'package:my_phobia/screens/user/terms.dart';
import 'package:my_phobia/screens/user/policy.dart';
import 'package:my_phobia/screens/user/about.dart';
import 'package:my_phobia/screens/user/change_password.dart';
import 'package:my_phobia/screens/user/help_feedback.dart';
import 'package:my_phobia/screens/inbox.dart';
import 'package:my_phobia/screens/chat.dart';
import 'package:my_phobia/screens/user/customer_support.dart';
import 'package:my_phobia/screens/forgot_password.dart';
import 'package:my_phobia/screens/otp.dart';
import 'package:my_phobia/screens/reset_password.dart';
import 'package:my_phobia/screens/user/splash.dart';
import 'package:my_phobia/screens/login.dart';
import 'package:my_phobia/screens/user/notification.dart';
import 'package:my_phobia/screens/therapist/create_profile.dart';
import 'package:my_phobia/screens/therapist/schedule_appointment.dart';
import 'package:my_phobia/screens/therapist/upcoming_appointments.dart';
import 'package:my_phobia/screens/therapist/appointment_details.dart';
import 'package:my_phobia/screens/therapist/reason_screen.dart';
import 'package:my_phobia/screens/therapist/edit_appointment.dart';
import 'package:my_phobia/screens/therapist/patient_progress_tracking.dart';
import 'package:my_phobia/screens/therapist/inbox.dart';
import 'package:my_phobia/screens/therapist/appointment_management.dart';
import 'package:my_phobia/screens/therapist/bottom_nav_wrapper.dart';

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
        '/create_profile': (context) => const CreateProfile(),
        '/therapist_home': (context) => const TherapistBottomNavWrapper(),
        '/schedule_appointment': (context) => const ScheduleAppointment(),
        '/upcoming_appointments': (context) => const UpcomingAppointments(),
        '/appointment_details': (context) => const AppointmentDetails(),
        '/reason_screen': (context) => const ReasonScreen(),
        '/edit_appointment': (context) => const EditAppointment(),
        '/patient_progress_tracking': (context) => const PatientProgressTracking(),
        '/therapist_inbox': (context) => const TherapistInbox(),
        '/appointment_management': (context) => const AppointmentManagement(),
      },
    );
  }
}
