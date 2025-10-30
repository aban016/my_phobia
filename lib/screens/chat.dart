import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';

class Chat extends StatefulWidget {
  final String contactName;
  final String contactImage;
  
  const Chat({
    super.key,
    this.contactName = "Josiah Zayner",
    this.contactImage = "assets/images/user-pfp.png",
  });

  static Route<void> route(String contactName, String contactImage) {
    return MaterialPageRoute<void>(
      builder: (_) => Chat(
        contactName: contactName,
        contactImage: contactImage,
      ),
    );
  }

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            title: widget.contactName,
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
                    
                    // Received Message 1
                    _buildReceivedMessage(
                      "Lorem ipsum dolor sit amet consectetur adipiscing???",
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Received Message 2
                    _buildReceivedMessage(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit maecenas porta fermentum",
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Date Separator
                    _buildDateSeparator("Today"),
                    
                    const SizedBox(height: 20),
                    
                    // Sent Message 1
                    _buildSentMessage(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit maecenas porta fermentum",
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Sent Message 2
                    _buildSentMessage(
                      "Lorem ipsum dolor sit amet consectetur adipiscing.",
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Received Message 3
                    _buildReceivedMessage(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit maecenas..!",
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
                    Iconsax.send_2,
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

  Widget _buildReceivedMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture
        ProfilePicture(
          imagePath: widget.contactImage,
          size: 40,
          borderWidth: 2,
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
        
        // Profile Picture
        ProfilePicture(
          imagePath: widget.contactImage,
          size: 40,
          borderWidth: 2,
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
