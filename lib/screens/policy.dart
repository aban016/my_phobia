import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Privacy Policy",
            backgroundImage: "assets/images/home.png",
            onBack: () {
              Navigator.pop(context);
            },
          ),
          
          // Main Content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    
                    // Dummy text content
                    const Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit\n"
                      "esse cillum dolore eu fugiat nulla pariatuDuis aute irure\n"
                      "dolor in reprehenderit in voluptate velit esse cillum dolore\n"
                      "eu fugiat nulla pariatu",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit\n"
                      "esse cillum dolore eu fugiat nulla pariatuDuis aute irure\n"
                      "dolor in reprehenderit in voluptate velit esse cillum dolore\n"
                      "eu fugiat nulla pariatu Duis aute irure dolor in\n"
                      "reprehenderit in voluptate velit esse cillum dolore eu\n"
                      "fugiat nulla pariatuDuis aute irure dolor in reprehenderit in\n"
                      "voluptate velit esse cillum dolore eu fugiat nulla pariatu",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit\n"
                      "esse cillum dolore eu fugiat nulla pariatuDuis aute irure\n"
                      "dolor in reprehenderit in voluptate velit esse cillum dolore\n"
                      "eu fugiat.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit\n"
                      "esse cillum dolore eu fugiat nulla pariatuDuis aute irure\n"
                      "dolor in reprehenderit in voluptate velit esse cillum dolore\n"
                      "eu fugiat nulla pariatu Duis aute irure dolor in\n"
                      "reprehenderit in voluptate velit esse cillum dolore eu\n"
                      "fugiat nulla pariatuDuis aute irure dolor in.\n"
                      "reprehenderit in voluptate velit esse cillum dolore eu\n"
                      "fugiat nulla pariatu",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit\n"
                      "esse cillum dolore eu fugiat nulla pariatuDuis aute irure\n"
                      "dolor in reprehenderit in voluptate velit esse cillum dolore\n"
                      "eu fugiat.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
