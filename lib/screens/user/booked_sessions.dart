import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/user/feedback.dart';
import 'package:my_phobia/screens/user/therapist_details.dart';

class BookedSessionsScreen extends StatefulWidget {
  const BookedSessionsScreen({super.key});

  @override
  State<BookedSessionsScreen> createState() => _BookedSessionsScreenState();
}

class _BookedSessionsScreenState extends State<BookedSessionsScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = ['Upcoming Sessions', 'Past Sessions', 'Current Sessions'];

  final List<Map<String, dynamic>> allSessions = [
    {
      'therapistName': 'David Warren',
      'rating': '4.5',
      'sessionType': 'Therapeutic Trainings',
      'timeLeft': '2 Days Left',
      'category': 'upcoming',
      'date': 'Dec 25, 2024',
      'time': '10:00 AM',
    },
    {
      'therapistName': 'Sarah Johnson',
      'rating': '4.8',
      'sessionType': 'Cognitive Behavioral Therapy',
      'timeLeft': '5 Days Left',
      'category': 'upcoming',
      'date': 'Dec 28, 2024',
      'time': '2:30 PM',
    },
    {
      'therapistName': 'Michael Chen',
      'rating': '4.6',
      'sessionType': 'Exposure Therapy',
      'timeLeft': '1 Week Left',
      'category': 'upcoming',
      'date': 'Jan 2, 2025',
      'time': '11:15 AM',
    },
    {
      'therapistName': 'Emily Rodriguez',
      'rating': '4.9',
      'sessionType': 'Mindfulness Training',
      'timeLeft': '3 Days Left',
      'category': 'upcoming',
      'date': 'Dec 26, 2024',
      'time': '3:45 PM',
    },
    {
      'therapistName': 'Dr. James Wilson',
      'rating': '4.7',
      'sessionType': 'Virtual Therapy Session',
      'timeLeft': '00:59 Mins Left',
      'category': 'current',
      'date': 'Today',
      'time': 'Now',
    },
    {
      'therapistName': 'Lisa Thompson',
      'rating': '4.4',
      'sessionType': 'Group Therapy',
      'timeLeft': '00:45 Mins Left',
      'category': 'current',
      'date': 'Today',
      'time': 'Now',
    },
    {
      'therapistName': 'Robert Davis',
      'rating': '4.6',
      'sessionType': 'Individual Counseling',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 20, 2024',
      'time': 'Completed',
    },
    {
      'therapistName': 'Jennifer Brown',
      'rating': '4.8',
      'sessionType': 'Anxiety Management',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 18, 2024',
      'time': 'Completed',
    },
    {
      'therapistName': 'David Warren',
      'rating': '4.5',
      'sessionType': 'Therapeutic Trainings',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 15, 2024',
      'time': 'Completed',
    },
    {
      'therapistName': 'Dr. Amanda Foster',
      'rating': '4.9',
      'sessionType': 'Phobia Treatment',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 12, 2024',
      'time': 'Completed',
    },
    {
      'therapistName': 'Mark Taylor',
      'rating': '4.3',
      'sessionType': 'Stress Management',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 10, 2024',
      'time': 'Completed',
    },
    {
      'therapistName': 'Dr. James Wilson',
      'rating': '4.7',
      'sessionType': 'Virtual Therapy Session',
      'timeLeft': 'Completed',
      'category': 'past',
      'date': 'Dec 8, 2024',
      'time': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ TopBar
          CustomTopBar(
            title: "Booked Sessions",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          // ✅ Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildTabBar(),
                  _buildSessionsList(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Horizontal Tab Bar
  Widget _buildTabBar() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final isSelected = selectedTabIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTabIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [
                          Color(0xFFF5A626),
                          Color(0xFFEE3A8E),
                          Color(0xFF8944CD),
                          Color(0xFF5222E8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? Colors.transparent : const Color.fromARGB(0, 224, 224, 224),
                  width: 0,
                ),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 Get filtered sessions based on selected tab
  List<Map<String, dynamic>> getFilteredSessions() {
    String category = '';
    switch (selectedTabIndex) {
      case 0:
        category = 'upcoming';
        break;
      case 1:
        category = 'past';
        break;
      case 2:
        category = 'current';
        break;
    }
    return allSessions.where((session) => session['category'] == category).toList();
  }

  // 🔹 List of Session Cards
  Widget _buildSessionsList() {
    final filteredSessions = getFilteredSessions();

    if (filteredSessions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Icon(
              Icons.event_note_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No sessions found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No ${tabs[selectedTabIndex].toLowerCase()} at the moment',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredSessions.length,
      itemBuilder: (context, index) {
        final session = filteredSessions[index];
        return _buildSessionCard(session, context);
      },
    );
  }

  // 🔹 Individual Session List Item
  Widget _buildSessionCard(Map<String, dynamic> session, BuildContext context) {
    final bool isPast = session['category'] == 'past';

    // Responsive font/icon sizes
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallDevice = screenWidth < 350;

    double nameFontSize = isSmallDevice ? 12 : 14;
    double starSize = isSmallDevice ? 11 : 14;
    double ratingFontSize = isSmallDevice ? 10 : 12;
    double subtitleFontSize = isSmallDevice ? 10 : 12;

    // Determine the session status text
    String sessionStatusText;
    if (selectedTabIndex == 2) {
      sessionStatusText = "Start Session";
    } else {
      sessionStatusText = session['timeLeft'];
    }

    // Wrap the entire session row except the action button with GestureDetector
    return GestureDetector(
      onTap: () {
        // Navigate to therapist detail screen when any area except the action button is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TherapistDetails(),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFF0F0F0),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Therapist Image
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEE3A8E), width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/user-pfp.png'),
                  ),
                ),
                SizedBox(width: isSmallDevice ? 8 : 16),
                // Therapist Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: isSmallDevice ? 80 : null,
                            child: Text(
                              session['therapistName'],
                              maxLines: 1,
                              overflow: isSmallDevice ? TextOverflow.fade : TextOverflow.ellipsis,
                              softWrap: !isSmallDevice,
                              style: TextStyle(
                                fontSize: nameFontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: isSmallDevice ? 5 : 8),
                          Image.asset('assets/images/icons/star.png', width: starSize, height: starSize),
                          SizedBox(width: isSmallDevice ? 3 : 4),
                          Text(
                            session['rating'],
                            style: TextStyle(
                              fontSize: ratingFontSize,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        session['sessionType'],
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Session Time/Status with gradient border and gradient text
                GestureDetector(
                  onTap: () {
                    // Stop event from propagating to parent onTap
                    if (session['category'] == 'current') {
                      PopupHelper.showSuccess(
                        context: context,
                        title: "Warning",
                        message: "You are leaving the platform. Do you want to continue with google.meet.com",
                        buttonText: "Continue",
                        onButtonPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      );
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFF5A626),
                          Color(0xFFEE3A8E),
                          Color(0xFF8944CD),
                          Color(0xFF5222E8),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFFF5A626),
                            Color(0xFFEE3A8E),
                            Color(0xFF8944CD),
                            Color(0xFF5222E8),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        blendMode: BlendMode.srcIn,
                        child: Text(
                          sessionStatusText,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white, // gets overridden by ShaderMask
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isPast) ...[
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  // This is okay to follow usual, because it's not the overall list card
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "Provide Ratings",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
