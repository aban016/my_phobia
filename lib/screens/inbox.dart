import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/chat.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Inbox",
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
                    const SizedBox(height: 20),
                    
                    // Activities Section
                    const Text(
                      "Activities",
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
                            {'name': 'Emma', 'image': 'assets/images/user-pfp.png'},
                            {'name': 'Ava', 'image': 'assets/images/user-pfp.png'},
                            {'name': 'Sophia', 'image': 'assets/images/user-pfp.png'},
                            {'name': 'Emelie', 'image': 'assets/images/user-pfp.png'},
                            {'name': 'Ava', 'image': 'assets/images/user-pfp.png'},
                          ];
                          
                          final activity = activities[index];
                          
                          return Container(
                            width: 80,
                            margin: const EdgeInsets.only(right: 0, top: 5),
                            child: Column(
                              children: [
                                // Profile Picture
                                ProfilePicture(
                                  imagePath: activity['image']!,
                                  size: 54,
                                  borderWidth: 2,
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
                      "Messages",
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
                            'name': 'Josiah Zayner',
                            'subject': 'Hi there!',
                            'snippet': 'How are you today?',
                            'time': '9.56 AM',
                            'image': 'assets/images/user-pfp.png',
                          },
                          {
                            'name': 'Jillian Jacob',
                            'subject': "It's been a while",
                            'snippet': 'Hi, I put together some photos from...',
                            'time': 'yesterday',
                            'image': 'assets/images/user-pfp.png',
                          },
                          {
                            'name': 'Victoria Hanson',
                            'subject': 'Photos from holiday',
                            'snippet': 'Here are some photos from our holiday...',
                            'time': '5 Mar',
                            'image': 'assets/images/user-pfp.png',
                          },
                          {
                            'name': 'Emma Wilson',
                            'subject': 'Meeting tomorrow',
                            'snippet': 'Don\'t forget about our meeting tomorrow...',
                            'time': '4 Mar',
                            'image': 'assets/images/user-pfp.png',
                          },
                          {
                            'name': 'Sophia Davis',
                            'subject': 'Project update',
                            'snippet': 'I wanted to update you on the project...',
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
                              ProfilePicture(
                                imagePath: message['image']!,
                                size: 38,
                                borderWidth: 2,
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
                                    
                                    // const SizedBox(height: 4),
                                    
                                    // Subject
                                    // Text(
                                    //   message['subject']!,
                                    //   style: const TextStyle(
                                    //     color: Color(0xFF320F7D),
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    
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
          ),
        ],
      ),
    );
  }
}
