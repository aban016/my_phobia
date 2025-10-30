import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/profile_picture.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  
  const HomeScreen({super.key, this.scaffoldKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Hi, Therapist!",
            backgroundImage: "assets/images/home.png",
            showMenuIcon: true,
            showBellIcon: true,
            scaffoldKey: widget.scaffoldKey,
            isTherapist: true,
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
                  // GradientButton(
                  //   text: "Schedule New Appointment",
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/schedule_appointment');
                  //   },
                  // ),
                  
                  const SizedBox(height: 100), // Space for bottom nav
                ],
                          ),
                        ),
                      ),
                    ],
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
                "${_getMonthName(DateTime.now().month)} ${DateTime.now().year}",
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
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    final firstDayWeekday = firstDayOfMonth.weekday % 7; // Convert to 0-6 (Sunday = 0)
    final daysInMonth = lastDayOfMonth.day;
    
    List<List<int>> weeks = [];
    List<int> currentWeek = [];
    
    // Add empty cells for days before the first day of the month
    for (int i = 0; i < firstDayWeekday; i++) {
      currentWeek.add(0);
    }
    
    // Add all days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      currentWeek.add(day);
      if (currentWeek.length == 7) {
        weeks.add(List.from(currentWeek));
        currentWeek.clear();
      }
    }
    
    // Add remaining empty cells to complete the last week
    while (currentWeek.length < 7 && currentWeek.isNotEmpty) {
      currentWeek.add(0);
    }
    if (currentWeek.isNotEmpty) {
      weeks.add(currentWeek);
    }
    
    return Column(
      children: weeks.map((week) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: week.map((day) => _buildDateCell(day, isToday: day == now.day)).toList(),
            ),
            if (weeks.indexOf(week) < weeks.length - 1) const SizedBox(height: 8),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildDateCell(int day, {bool isToday = false}) {
    if (day == 0) {
      return const SizedBox(width: 24, height: 24);
    }
    
    return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isToday ? const Color(0xFFFF6B35) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isToday ? Colors.white : Colors.grey.shade600,
            ),
          ),
        ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  // Today Appointments
  Widget _buildTodayAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today Appointments",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF320F7D),
          ),
        ),
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
                fontSize:16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF320F7D),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/upcoming_appointments');
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
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
      padding: EdgeInsets.zero,
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/appointment_details');
      },
      child: Container(
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
      child: Column(
        children: [
          Row(
            children: [
              // Patient Image
              ProfilePicture(
                imagePath: 'assets/images/user-pfp.png',
                size: 45,
                borderWidth: 2,
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
              // Start Now button on the right (for today appointments)
              if (appointment['time'] == 'Now')
                _buildTimeBadge(appointment['timeLeft']),
            ],
          ),
          // Time badges below patient info (for upcoming appointments)
          if (appointment['time'] != 'Now') ...[
            const SizedBox(height: 12),
            Row(
              children: [
                _buildTimeBadge(appointment['timeLeft']),
                const SizedBox(width: 8),
                _buildTimeBadge(appointment['time']),
              ],
            ),
          ],
        ],
      ),
      ),
    );
  }

  // Time Badge Helper
  Widget _buildTimeBadge(String text) {
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
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFEE3A8E), // simple pink color
          ),
        ),
      ),
    );
  }
}

