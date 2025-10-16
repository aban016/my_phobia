import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class HolisticSupport extends StatefulWidget {
  const HolisticSupport({super.key});

  @override
  State<HolisticSupport> createState() => _HolisticSupportState();
}

class _HolisticSupportState extends State<HolisticSupport> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar
        const CustomTopBar(
          title: "Holistic Support",
          backgroundImage: "assets/images/home.png",
          showMenuIcon: true,
          showBellIcon: true,
        ),
        
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
            child: Column(
              children: [
                // Search Bar
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF6B35), // Orange
                          Color(0xFFEE3A8D), // Pink
                          Color(0xFF320F7D), // Purple
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: "Search for specific patient...",
                                  hintStyle: TextStyle(
                                    color: const Color(0xFFD63D9D).withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFFD63D9D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: const Color(0xFFD63D9D),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // News Articles List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final articles = [
                      {
                        'image': 'assets/images/vt-u-bg.png',
                        'source': 'Harvard University',
                        'title': 'News related to Mental health 2024',
                        'reads': '5.32 k reads',
                        'time': '4 mins read',
                        'date': '23-02-2024',
                      },
                      {
                        'image': 'assets/images/vt-u-bg.png',
                        'source': 'Quin Research Lab',
                        'title': 'How To Control Public Fear',
                        'reads': '3.21 k reads',
                        'time': '6 mins read',
                        'date': '20-02-2024',
                      },
                    ];
                    
                    final article = articles[index];
                    
                    return GestureDetector(
                      onTap: () {
                        PopupHelper.showSuccess(
                          context: context,
                          title: "Warning",
                          message: "You are leaving the platform. Do you want to continue with quinn.com",
                          buttonText: "Continue",
                          onButtonPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image Section
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(article['image']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Purple overlay
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF320F7D).withOpacity(0.1),
                                        Color(0xFF320F7D).withOpacity(0.5),
                                        Color(0xFF320F7D).withOpacity(0.9),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              // Date
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    article['date']!,
                                    style: const TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text Section
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Source
                                Text(
                                  article['source']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                
                                // Title
                                Text(
                                  article['title']!,
                                  style: const TextStyle(
                                    color: Color(0xFF320F7D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Read Stats
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      article['reads']!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      article['time']!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    );
                  },
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
