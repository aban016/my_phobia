import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/bordered_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class EditAppointment extends StatefulWidget {
  const EditAppointment({super.key});

  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  final TextEditingController _selectDateController = TextEditingController();
  final TextEditingController _durationFromController = TextEditingController();
  final TextEditingController _setHoursController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedFromTime;
  TimeOfDay? _selectedHours;

  @override
  void dispose() {
    _selectDateController.dispose();
    _durationFromController.dispose();
    _setHoursController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF320F7D),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectFromTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedFromTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF320F7D),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedFromTime) {
      setState(() {
        _selectedFromTime = picked;
        _durationFromController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectHours() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedHours ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF320F7D),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedHours) {
      setState(() {
        _selectedHours = picked;
        _setHoursController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Top Bar
          CustomTopBar(
            title: "Edit Appointment",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
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
                  
                  // Patient Information
                  _buildPatientInfo(),
                  
                  const SizedBox(height: 30),
                  
                  // About Section
                  _buildAboutSection(),
                  
                  const SizedBox(height: 30),
                  
                  // Input Fields
                  _buildInputFields(),
                  
                  const SizedBox(height: 40),
                  
                  // Update Button
                  GradientButton(
                    text: "UPDATE",
                    onPressed: () {
                      _showRescheduleConfirmation();
                    },
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Patient Information
  Widget _buildPatientInfo() {
    return Row(
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
                spreadRadius: 3,
                blurStyle: BlurStyle.outer,
              ),
            ]
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
                  fontSize: 18,
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
            ],
          ),
        ),
      ],
    );
  }

  // About Section
  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF777777),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // Input Fields
  Widget _buildInputFields() {
    return Column(
      children: [
        // Select Date
        BorderedButton(
          text: "Select Date",
          onPressed: _selectDate,
        ),
        
        const SizedBox(height: 16),
        
        // Duration From
        BorderedButton(
          text: "Duration From",
          onPressed: _selectFromTime,
        ),
        
        const SizedBox(height: 16),
        
        // Set Your Hours
        BorderedButton(
          text: "Set Your Hours",
          onPressed: _selectHours,
        ),
      ],
    );
  }

  // Show Reschedule Confirmation
  void _showRescheduleConfirmation() {
    PopupHelper.showConfirmation(
      context: context,
      title: "Appointment Reschedule",
      message: "Are you sure you want to reschedule appointment?",
      confirmText: "Yes",
      cancelText: "No",
      onConfirm: () {
        _showSuccessPopup();
      },
      onCancel: () {
        // Just close the popup, no additional action needed
      },
    );
  }

  // Show Success Popup
  void _showSuccessPopup() {
    PopupHelper.showSuccess(
      context: context,
      title: "Congratulations!",
      message: "Your appointment with david warren is rescheduled successfully",
      buttonText: "Okay",
      onButtonPressed: () {
        Navigator.pushReplacementNamed(context, '/upcoming_appointments');
      },
    );
  }
}
