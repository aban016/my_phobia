import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/chat.dart';

class TherapistInbox extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  
  const TherapistInbox({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar (Therapist Style)
          CustomTopBar(
            title: "Communication",
            backgroundImage: "assets/images/home.png",
            showMenuIcon: true,
            showBellIcon: true,
            scaffoldKey: scaffoldKey,
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Activities Section
                  const Text(
                    "Patient Activities",
                    style: TextStyle(
                      color: Color(0xFF320F7D),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Activities Horizontal List
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final activities = [
                          {'name': 'David', 'image': 'assets/images/user-pfp.png'},
                          {'name': 'Sarah', 'image': 'assets/images/user-pfp.png'},
                          {'name': 'John', 'image': 'assets/images/user-pfp.png'},
                          {'name': 'Emma', 'image': 'assets/images/user-pfp.png'},
                          {'name': 'Mike', 'image': 'assets/images/user-pfp.png'},
                        ];
                        
                        final activity = activities[index];
                        
                        return Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 0, top: 5),
                          child: Column(
                            children: [
                              // Profile Picture
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFEE3A8E),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x7DE91E62),
                                      blurRadius: 0,
                                      spreadRadius: 4,
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage(activity['image']!),
                                ),
                              ),
                              
                              const SizedBox(height: 8),
                              
                              // Name
                              Text(
                                activity['name']!,
                                style: const TextStyle(
                                  color: Color(0xFF320F7D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Messages Section
                  const Text(
                    "Patient Messages",
                    style: TextStyle(
                      color: Color(0xFF320F7D),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  // Messages List
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final messages = [
                        {
                          'name': 'David Warren',
                          'subject': 'Session Feedback',
                          'snippet': 'Thank you for today\'s session. I feel much better...',
                          'time': '9.56 AM',
                          'image': 'assets/images/user-pfp.png',
                        },
                        {
                          'name': 'Sarah Johnson',
                          'subject': 'Appointment Request',
                          'snippet': 'Hi, I would like to schedule an appointment...',
                          'time': 'yesterday',
                          'image': 'assets/images/user-pfp.png',
                        },
                        {
                          'name': 'John Smith',
                          'subject': 'Progress Update',
                          'snippet': 'I wanted to share my progress since our last...',
                          'time': '5 Mar',
                          'image': 'assets/images/user-pfp.png',
                        },
                        {
                          'name': 'Emma Wilson',
                          'subject': 'Question about therapy',
                          'snippet': 'I have a question about the techniques we...',
                          'time': '4 Mar',
                          'image': 'assets/images/user-pfp.png',
                        },
                        {
                          'name': 'Mike Davis',
                          'subject': 'Thank you message',
                          'snippet': 'Thank you for helping me through this difficult...',
                          'time': '3 Mar',
                          'image': 'assets/images/user-pfp.png',
                        },
                      ];
                      
                      final message = messages[index];
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            Chat.route(
                              message['name']!,
                              message['image']!,
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                          children: [
                            // Profile Picture
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFEE3A8E),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x7DE91E62),
                                    blurRadius: 0,
                                    spreadRadius: 4,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 23,
                                backgroundImage: AssetImage(message['image']!),
                              ),
                            ),
                            
                            const SizedBox(width: 15),
                            
                            // Message Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name and Time Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        message['name']!,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        message['time']!,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 4),
                                  
                                  // Subject
                                  Text(
                                    message['subject']!,
                                    style: const TextStyle(
                                      color: Color(0xFF320F7D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 2),
                                  
                                  // Snippet
                                  Text(
                                    message['snippet']!,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
