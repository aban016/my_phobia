import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

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

                  // OTP Form
                  Container(
                    child: Column(
                      children: [
                        Text("OTP", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),),
                        const SizedBox(height: 10),
                        Text("We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity", 
                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white), 
                             textAlign: TextAlign.center,),
                        
                        const SizedBox(height: 40),

                        // OTP Input Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFF5A626),
                                    Color(0xFFEE3A8E),
                                    Color(0xFF8944CD),
                                    Color(0xFF5222E8),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xFF090A13),
                                  shape: BoxShape.circle,
                                ),
                                child: TextField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) => _onDigitChanged(value, index),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                    hintText: index < 3 ? "5" : "-",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),

                        // Code didn't receive text
                        Text("Code didn't receive?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                        const SizedBox(height: 5),
                        
                        // Resend Code
                        GestureDetector(
                          onTap: () {
                            // Handle resend code
                          },
                          child: Text("Resend Code", 
                                 style: TextStyle(
                                   fontSize: 14, 
                                   fontWeight: FontWeight.w600, 
                                   color: Colors.white,
                                   decoration: TextDecoration.underline,
                                   decorationColor: Colors.white,
                                 ),),
                        ),

                        const SizedBox(height: 30),

                        // Verify Button
                        GradientButton(
                          text: "VERIFY",
                          onPressed: () {
                            Navigator.pushNamed(context, '/reset_password');
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
