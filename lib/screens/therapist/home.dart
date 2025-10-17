import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/custom_bottom_nav.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1; // Home is selected by default
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideMenu(isTherapist: true),
      drawerScrimColor: Colors.black.withOpacity(0.5),
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Hi, Tetiana!",
            backgroundImage: "assets/images/home.png",
            showMenuIcon: true,
            showBellIcon: true,
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
                  
                  // Calendar Section
                  _buildCalendarCard(),
                  
                  const SizedBox(height: 30),
                  
                  // Today Appointments
                  _buildTodayAppointments(),
                  
                  const SizedBox(height: 30),
                  
                  // Upcoming Appointments
                  _buildUpcomingAppointments(),
                  
                  const SizedBox(height: 30),
                  
                  // Schedule New Appointment Button (original gradient)
                  GradientButton(
                    text: "Schedule New Appointment",
                    onPressed: () {
                      // Handle schedule appointment
                    },
                  ),
                  
                  const SizedBox(height: 100), // Space for bottom nav
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          // Handle navigation
          switch (index) {
            case 0:
              // Progress Tracking
              break;
            case 1:
              // Home (current screen)
              break;
            case 2:
              // Communication
              break;
          }
        },
        isTherapist: true,
      ),
    );
  }


  // Calendar Card
  Widget _buildCalendarCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF5A626),
              Color(0xFFEE3A8E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(1.5),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.5),
          ),
          child: Column(
            children: [
              // Month and Year
              Text(
                "June 2023",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF320F7D),
                ),
              ),
              const SizedBox(height: 16),
              
              // Days of week
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("SUN", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("MON", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("TUE", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("WED", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("THU", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("FRI", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("SAT", style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Calendar dates
              _buildCalendarGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return Column(
      children: [
        // First week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(1),
          ],
        ),
        const SizedBox(height: 8),
        // Second week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(2), _buildDateCell(3), _buildDateCell(4), _buildDateCell(5), _buildDateCell(6), _buildDateCell(7), _buildDateCell(8),
          ],
        ),
        const SizedBox(height: 8),
        // Third week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(9), _buildDateCell(10), _buildDateCell(11), _buildDateCell(12), _buildDateCell(13), _buildDateCell(14), _buildDateCell(15),
          ],
        ),
        const SizedBox(height: 8),
        // Fourth week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(16), _buildDateCell(17), _buildDateCell(18), _buildDateCell(19), _buildDateCell(20), _buildDateCell(21), _buildDateCell(22),
          ],
        ),
        const SizedBox(height: 8),
        // Fifth week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(23, isSelected: true), _buildDateCell(24), _buildDateCell(25), _buildDateCell(26), _buildDateCell(27), _buildDateCell(28), _buildDateCell(29),
          ],
        ),
        const SizedBox(height: 8),
        // Sixth week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateCell(30), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0), _buildDateCell(0),
          ],
        ),
      ],
    );
  }

  Widget _buildDateCell(int day, {bool isSelected = false}) {
    if (day == 0) {
      return const SizedBox(width: 24, height: 24);
    }
    
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF6B35) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          day.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  // Today Appointments
  Widget _buildTodayAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today Appointments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF320F7D),
          ),
        ),
        const SizedBox(height: 16),
        _buildAppointmentsList([
          {
            'patientName': 'David Warren',
            'sessionType': 'Therapy Patient',
            'timeLeft': 'Start Now',
            'date': 'Today',
            'time': 'Now',
          },
        ]),
      ],
    );
  }

  // Upcoming Appointments
  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Upcoming Appointments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF320F7D),
              ),
            ),
            const Text(
              "See All",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildAppointmentsList([
          {
            'patientName': 'David Warren',
            'sessionType': 'Therapy Patient',
            'timeLeft': 'Today, September 2',
            'date': 'Today, September 2',
            'time': '10:00 - 11:00 AM',
          },
          {
            'patientName': 'David Warren',
            'sessionType': 'Therapy Patient',
            'timeLeft': 'Today, September 2',
            'date': 'Today, September 2',
            'time': '10:00 - 11:00 AM',
          },
        ]),
      ],
    );
  }

  // Appointments List (matching booked sessions design)
  Widget _buildAppointmentsList(List<Map<String, dynamic>> appointments) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return _buildAppointmentListItem(appointment);
      },
    );
  }

  // Individual Appointment List Item (matching booked sessions design)
  Widget _buildAppointmentListItem(Map<String, dynamic> appointment) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
      child: Row(
        children: [
          // Patient Image
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
          const SizedBox(width: 16),
          // Patient Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment['patientName'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  appointment['sessionType'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Status/Time Badge with gradient border (like booked sessions)
          Container(
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
                  appointment['timeLeft'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // gets overridden by ShaderMask
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

