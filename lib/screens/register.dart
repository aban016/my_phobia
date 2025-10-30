import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/login.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  // Logo
                  Container(
                    margin: const EdgeInsets.only(top: 50),
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

                  // Signup Form
                  Column(
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const Text(
                        "Enter your details to register yourself",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),

                      const SizedBox(height: 25),

                      // Full Name
                      _buildGradientTextField(hint: "Full Name"),

                      const SizedBox(height: 15),

                      // Email
                      _buildGradientTextField(hint: "Email"),

                      const SizedBox(height: 15),

                      // Password
                      _buildGradientTextField(hint: "Password", obscure: true),

                      const SizedBox(height: 15),

                      // Confirm Password
                      _buildGradientTextField(hint: "Confirm Password", obscure: true),

                      const SizedBox(height: 25),

                      // Signup Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Handle signup
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF5A626),
                                  Color(0xFFEE3A8E),
                                  Color(0xFF8944CD),
                                  Color(0xFF5222E8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "SIGNUP NOW",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Already have account?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()), 
                              );
                            },
                            child: const Text(
                              "Login Here",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // Divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 100,
                            height: 1,
                            color: const Color(0xFF777777),
                          ),
                          const Text(
                            "Sign up with",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 100,
                            height: 1,
                            color: const Color(0xFF777777),
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                            icon: Icon(Iconsax.google_1, size: 24, color: Color(0xFFEE3A8D),),
                          ),
                          _buildSocialButton(
                            icon: Icon(Iconsax.apple, size: 24, color: Color(0xFFEE3A8D),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Gradient TextField Builder
  Widget _buildGradientTextField({required String hint, bool obscure = false}) {
    return Container(
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
          color: const Color(0xFF01122F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ),
      ),
    );
  }

  // 🔹 Social Button Builder
  Widget _buildSocialButton({required Widget icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
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
        decoration: const BoxDecoration(
          color: Color(0xFF090A13),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {},
          icon: icon,
        ),
      ),
    );
  }
}
