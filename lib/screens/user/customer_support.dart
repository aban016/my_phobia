import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Customer Support",
            backgroundImage: "assets/images/home.png",
            onBack: () {
              Navigator.pop(context);
            },
          ),
          
          // Chat Messages Area
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    // Welcome Message from Support
                    _buildReceivedMessage(
                      "Hello! Welcome to our customer support. How can I help you today?",
                      "Support Agent",
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // User's Question
                    _buildSentMessage(
                      "Hi, I'm having trouble with my account settings. Can you help me?",
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Support Response
                    _buildReceivedMessage(
                      "Of course! I'd be happy to help you with your account settings. What specific issue are you experiencing?",
                      "Support Agent",
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Date Separator
                    _buildDateSeparator("Today"),
                    
                    const SizedBox(height: 20),
                    
                    // User's Follow-up
                    _buildSentMessage(
                      "I can't seem to change my password. The form keeps showing an error.",
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Support Response
                    _buildReceivedMessage(
                      "I understand the issue. Let me guide you through the password change process step by step. First, make sure you're entering your current password correctly.",
                      "Support Agent",
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          
          // Message Input Field
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                // Message Input Field
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xFFEE3A8E),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: TextStyle(
                          color: Color(0xFFD63D9D),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 10),
                
                // Send Button
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEE3A8D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String text, String senderName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Support Agent Profile Picture
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFEE3A8E),
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF320F7D),
            child: Icon(
              Icons.support_agent,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        
        const SizedBox(width: 10),
        
        // Message Bubble
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  senderName,
                  style: const TextStyle(
                    color: Color(0xFF320F7D),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSentMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Message Bubble
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5A626).withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 10),
        
        // User Profile Picture
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFEE3A8E),
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/user-pfp.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSeparator(String date) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            date,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
