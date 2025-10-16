import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/user/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallDevice = screenWidth < 350;

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

                  // Login Form
                  Container(
                    child: Column(
                      children: [
                        Text("Welcome to", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),),
                        Text("Enter your account details to login", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                        
                        const SizedBox(height: 25),

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
                            margin: const EdgeInsets.all(2), // Gradient dikhega sirf border ki tarah
                            decoration: BoxDecoration(
                              color: Color(0xFF090A13), // Field ka background (ya Colors.grey.withOpacity(0.1))
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Password
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
                              color: Color(0xFF090A13),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                            child: const Text("Forgot Password?", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Login Button
                        GradientButton(
                          text: "LOGIN NOW",
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        ),

                        const SizedBox(height: 15),

                        // Signup link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 14
                                ),),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignUp()), 
                                );
                              },
                              child: const Text(
                                "SignUp Here",
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
                          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,      
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: isSmallDevice ? 50 : 100,
                              height: 1,
                              color: Color(0xFF777777),
                            ),
                            Text("Login with",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: isSmallDevice ? 50 : 100,
                              height: 1,
                              color: Color(0xFF777777),
                            ),
                          ],
                        ),

                        const SizedBox(height: 35),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                                decoration: const BoxDecoration(
                                  color: Color(0xFF090A13),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                                ),
                              ),
                            ),

                            // Apple
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                                decoration: const BoxDecoration(
                                  color: Color(0xFF090A13),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.apple, color: Colors.white), 
                                ),
                              ),
                            ),

                            // Facebook
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                                decoration: const BoxDecoration(
                                  color: Color(0xFF090A13),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.facebook, color: Colors.white), // 👈 Facebook icon
                                ),
                              ),
                            ),
                          ],
                        )

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
