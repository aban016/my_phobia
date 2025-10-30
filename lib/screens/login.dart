import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/background.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:my_phobia/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  // Dummy users array with roles
  final List<Map<String, dynamic>> dummyUsers = [
    {
      'email': 'user',
      'password': '123',
      'role': 'user',
      'name': 'John Doe',
    },
    {
      'email': 'therapist',
      'password': '123',
      'role': 'therapist',
      'name': 'Dr. Sarah Smith',
    },
    {
      'email': 'admin',
      'password': '123',
      'role': 'user',
      'name': 'Admin User',
    },
  ];

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Check if fields are empty
    if (email.isEmpty || password.isEmpty) {
      PopupHelper.showError(
        context: context,
        title: "Missing Information",
        message: "Please enter both email and password.",
        buttonText: "OK",
      );
      return;
    }

    // Find user in dummy array
    final user = dummyUsers.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      // Navigate based on user role
      if (user['role'] == 'therapist') {
        Navigator.pushReplacementNamed(context, '/therapist_home');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      // Show error popup for invalid credentials
      PopupHelper.showError(
        context: context,
        title: "Login Failed",
        message: "Invalid email or password. Please try again.",
        buttonText: "OK",
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                              color: Color(0xFF01122F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                              color: Color(0xFF01122F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Remember Me and Forgot Password row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember Me checkbox
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _rememberMe = !_rememberMe;
                                    });
                                  },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      color: _rememberMe ? Colors.transparent : Colors.transparent,
                                    ),
                                    child: _rememberMe
                                        ? const Icon(
                                            Icons.check,
                                            size: 11,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // Forgot Password
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot_password');
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Login Button
                        GradientButton(
                          text: "Login Now",
                          onPressed: _handleLogin,
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
                                  icon: Icon(Iconsax.google_1, size: 24, color: Color(0xFFEE3A8D),),
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
                                  icon: Icon(Iconsax.apple, size: 24, color: Color(0xFFEE3A8D),),
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
