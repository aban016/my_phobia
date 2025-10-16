import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  String selectedTime = "04:00 PM";
  int selectedTimeIndex = 0;

  final List<String> timeSlots = [
    "04:00 PM - 05:00 PM",
    "04:00 PM - 05:00 PM",
    "07:00 PM - 08:00 PM",
    "07:00 PM - 08:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Booking Details",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Availability Section
                  const Text(
                    "Date Availability",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF320F7D),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Calendar Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(
                          colors: [    Color(0xFFF5A626),
                              Color(0xFFEE3A8E),
                              Color(0xFF8944CD),
                              Color(0xFF5222E8),],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                        ),
                    child: Column(
                      children: [
                        // Month and Year Header with Navigation
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF320F7D).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.chevron_left,
                                  color: Color(0xFF320F7D),
                                  size: 20,
                                ),
                              ),
                            ),
                            Text(
                              "${_getMonthName(currentMonth.month)} ${currentMonth.year}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF320F7D),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF320F7D).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF320F7D),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Days of the week
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "SUN",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "MON",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "TUE",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "WED",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "THU",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "FRI",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "SAT",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Calendar Grid
                        _buildCalendarGrid(),
                      ],
                    ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Time Availability Section
                  const Text(
                    "Time Availability",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF320F7D),
                    ),
                  ),
                  
                  // Time Slots Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3.5,
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTimeIndex = index;
                            selectedTime = timeSlots[index].split(" - ")[0];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                          decoration: BoxDecoration(
                            color: selectedTimeIndex == index 
                                ? Colors.grey.shade200 
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedTimeIndex == index 
                                  ? const Color(0xFF320F7D).withOpacity(0.3)
                                  : Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              timeSlots[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: selectedTimeIndex == index 
                                    ? const Color(0xFF320F7D)
                                    : Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 6),
                  
                  // Selected Date Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFF5A626),
                                  Color(0xFFEE3A8E),
                                  Color(0xFF8944CD),
                                  Color(0xFF5222E8),],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(1.5),
                        child: Container(
                          height: 57,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // "Selected Date" label - above the border
                      Positioned(
                        left: 18,
                        top: -10,
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Text(
                              "Selected Date",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEE3A8E),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Selected Time Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFF5A626),
                                  Color(0xFFEE3A8E),
                                  Color(0xFF8944CD),
                                  Color(0xFF5222E8),],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(1.5),
                        child: Container(
                          height: 57,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                selectedTime,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // "Selected Time" label - above the border
                      Positioned(
                        left: 18,
                        top: -10,
                        height: 20,
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Text(
                              "Selected Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEE3A8E),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),

                  GradientButton(
                          text: "Continue For \$35.00",
                          onPressed: () {
                            Navigator.pushNamed(context, '/payment_methods');
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

  Widget _buildCalendarGrid() {
    final int daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    final int firstDayOfWeek = DateTime(currentMonth.year, currentMonth.month, 1).weekday;
    
    List<List<int>> calendarDays = [];
    List<int> currentWeek = [];
    
    // Add empty cells for days before the first day of the month
    for (int i = 1; i < firstDayOfWeek; i++) {
      currentWeek.add(0);
    }
    
    // Add all days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      currentWeek.add(day);
      
      // If we have 7 days in the week, start a new week
      if (currentWeek.length == 7) {
        calendarDays.add(List.from(currentWeek));
        currentWeek.clear();
      }
    }
    
    // Add remaining empty cells to complete the last week
    while (currentWeek.length < 7 && currentWeek.isNotEmpty) {
      currentWeek.add(0);
    }
    
    if (currentWeek.isNotEmpty) {
      calendarDays.add(currentWeek);
    }
    
    return Column(
      children: [
        for (int week = 0; week < calendarDays.length; week++)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int day = 0; day < 7; day++)
                    _buildDateCell(calendarDays[week][day]),
                ],
              ),
              if (week < calendarDays.length - 1) const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }

  Widget _buildDateCell(int day) {
    if (day == 0) {
      return const SizedBox(width: 24, height: 24);
    }
    
    final DateTime cellDate = DateTime(currentMonth.year, currentMonth.month, day);
    final bool isSelected = selectedDate.year == cellDate.year && 
                           selectedDate.month == cellDate.month && 
                           selectedDate.day == cellDate.day;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = cellDate;
        });
      },
      child: Container(
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
      ),
    );
  }

  String _getMonthName(int month) {
    const List<String> monthNames = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month];
  }
}
