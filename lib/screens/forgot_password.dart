import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),

          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 90),
                  // Logo
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Forgot Password Form
                  Container(
                    child: Column(
                      children: [
                        Text("Forgot Password", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),),
                        const SizedBox(height: 10),
                        Text("Please enter your email to reset password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                        
                        const SizedBox(height: 40),

                        // Email
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF5A626),
                                Color(0xFFEE3A8E),
                                Color(0xFF8944CD),
                                Color(0xFF5222E8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xFF01122F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Next Button
                        GradientButton(
                          text: "Next",
                          onPressed: () {
                            Navigator.pushNamed(context, '/otp');
                          },
                        ),

                        const SizedBox(height: 35),
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
