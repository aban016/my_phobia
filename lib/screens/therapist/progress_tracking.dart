import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/bordered_button.dart';
import 'package:my_phobia/screens/components/custom_search_bar.dart';

class ProgressTracking extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  
  const ProgressTracking({super.key, this.scaffoldKey});

  @override
  State<ProgressTracking> createState() => _ProgressTrackingState();
}

class _ProgressTrackingState extends State<ProgressTracking> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
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
            title: "Progress Tracking",
            backgroundImage: "assets/images/home.png",
            showMenuIcon: true,
            showBellIcon: true,
            scaffoldKey: widget.scaffoldKey,
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
                  
                  // Patients List Section
                  _buildPatientsListSection(),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Patients List Section
  Widget _buildPatientsListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        const Text(
          "Patients List",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF320F7D),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Search Bar
        CustomSearchBar(
          controller: _searchController,
          hintText: "Search for specific patient...",
          icon: Icons.search,
        ),
        
        const SizedBox(height: 20),
        
        // Patients List
        _buildPatientsList(),
      ],
    );
  }


  // Patients List
  Widget _buildPatientsList() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3, // 3 patients as shown in screenshot
      itemBuilder: (context, index) {
        return _buildPatientCard();
      },
    );
  }

  // Individual Patient Card
  Widget _buildPatientCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Patient Info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text(
                      "David Warren",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
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
                    const SizedBox(height: 8),
                    Text(
                      "Last Therapy",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      "01-01-2024",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Side Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Therapy Starts",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "01-01-2024",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Progress Status",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "GOOD",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // View Progress Button
          BorderedButton(
            text: "View Progress",
            onPressed: () {
              Navigator.pushNamed(context, '/patient_progress_tracking');
            },
          ),
        ],
      ),
    );
  }
}
