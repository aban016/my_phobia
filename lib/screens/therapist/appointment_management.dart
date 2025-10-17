import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';

class AppointmentManagement extends StatefulWidget {
  const AppointmentManagement({super.key});

  @override
  State<AppointmentManagement> createState() => _AppointmentManagementState();
}

class _AppointmentManagementState extends State<AppointmentManagement> {
  int selectedTabIndex = 0; // 0: Upcoming, 1: Cancelled, 2: Completed

  final List<String> tabs = ['Upcoming', 'Cancelled', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Appointment Management",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
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
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  
                  // Tabs
                  _buildTabs(),
                  
                  const SizedBox(height: 20),
                  
                  // Appointments List
                  Expanded(
                    child: _buildAppointmentsList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tabs
  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = selectedTabIndex == index;
          
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: index < tabs.length - 1 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: isSelected ? const LinearGradient(
                    colors: [
                      Color(0xFFF5A626),
                      Color(0xFFEE3A8E),
                      Color(0xFF8944CD),
                      Color(0xFF5222E8),
                    ],
                  ) : null,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Appointments List
  Widget _buildAppointmentsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      itemCount: 5, // 5 appointments as shown in screenshots
      itemBuilder: (context, index) {
        return _buildAppointmentItem();
      },
    );
  }

  // Individual Appointment Item
  Widget _buildAppointmentItem() {
    String status = tabs[selectedTabIndex];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/appointment_details');
        },
        child: Column(
        children: [
          Row(
            children: [
              // Patient Image
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFEE3A8E), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x7DE91E62),
                      blurRadius: 0,
                      spreadRadius: 4,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/user-pfp.png'),
                ),
              ),
              const SizedBox(width: 16),
              // Patient Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "David Warren",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        if (status == "Cancelled" || status == "Completed")
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: status == "Cancelled" ? Colors.red : Colors.green,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Therapy Patient",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Date and Time Buttons
          Row(
            children: [
              _buildDateTimeBadge("Today, September 2"),
              const SizedBox(width: 8),
              _buildDateTimeBadge("10:00 - 11:00 AM"),
            ],
          ),
          const SizedBox(height: 16),
          // Divider
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      )
    );
  }

  // Date/Time Badge (matching home screen design)
  Widget _buildDateTimeBadge(String text) {
    return Container(
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
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white, // gets overridden by ShaderMask
            ),
          ),
        ),
      ),
    );
  }
}
