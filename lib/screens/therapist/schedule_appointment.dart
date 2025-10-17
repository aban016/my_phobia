import 'package:flutter/material.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _selectDateController = TextEditingController();
  final TextEditingController _durationFromController = TextEditingController();
  final TextEditingController _durationToController = TextEditingController();
  
  String? _patientNameError;
  String? _selectDateError;
  String? _durationFromError;
  String? _durationToError;

  DateTime? _selectedDate;
  TimeOfDay? _selectedFromTime;
  TimeOfDay? _selectedToTime;

  @override
  void dispose() {
    _patientNameController.dispose();
    _selectDateController.dispose();
    _durationFromController.dispose();
    _durationToController.dispose();
    super.dispose();
  }

  void _validatePatientName(String value) {
    if (value.isEmpty) {
      setState(() {
        _patientNameError = "Patient name is required";
      });
    } else if (value.length < 2) {
      setState(() {
        _patientNameError = "Name must be at least 2 characters";
      });
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      setState(() {
        _patientNameError = "Name can only contain letters and spaces";
      });
    } else {
      setState(() {
        _patientNameError = null;
      });
    }
  }

  void _validateSelectDate(String value) {
    if (value.isEmpty) {
      setState(() {
        _selectDateError = "Date is required";
      });
    } else {
      setState(() {
        _selectDateError = null;
      });
    }
  }

  void _validateDurationFrom(String value) {
    if (value.isEmpty) {
      setState(() {
        _durationFromError = "Start time is required";
      });
    } else {
      setState(() {
        _durationFromError = null;
      });
    }
  }

  void _validateDurationTo(String value) {
    if (value.isEmpty) {
      setState(() {
        _durationToError = "End time is required";
      });
    } else {
      setState(() {
        _durationToError = null;
      });
    }
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
        _validateSelectDate(_selectDateController.text);
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
        _validateDurationFrom(_durationFromController.text);
      });
    }
  }

  Future<void> _selectToTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedToTime ?? TimeOfDay.now(),
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
    
    if (picked != null && picked != _selectedToTime) {
      setState(() {
        _selectedToTime = picked;
        _durationToController.text = picked.format(context);
        _validateDurationTo(_durationToController.text);
      });
    }
  }

  bool _isFormValid() {
    return _patientNameError == null &&
           _selectDateError == null &&
           _durationFromError == null &&
           _durationToError == null &&
           _patientNameController.text.isNotEmpty &&
           _selectDateController.text.isNotEmpty &&
           _durationFromController.text.isNotEmpty &&
           _durationToController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Schedule New Appointment",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Patient Name Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF5A626),
                              Color(0xFFEE3A8E),
                              Color(0xFF8944CD),
                              Color(0xFF5222E8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _patientNameController,
                              onChanged: _validatePatientName,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Patient Name",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _patientNameError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD63D9D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Select Date Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF5A626),
                              Color(0xFFEE3A8E),
                              Color(0xFF8944CD),
                              Color(0xFF5222E8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _selectDateController,
                              readOnly: true,
                              onTap: _selectDate,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Select Date",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _selectDateError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                suffixIcon: const Icon(
                                  IconsaxPlusBold.calendar,
                                  color: Color(0xFFD63D9D),
                                  size: 20,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD63D9D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Duration From Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF5A626),
                              Color(0xFFEE3A8E),
                              Color(0xFF8944CD),
                              Color(0xFF5222E8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _durationFromController,
                              readOnly: true,
                              onTap: _selectFromTime,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Duration From",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _durationFromError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                suffixIcon: const Icon(
                                  IconsaxPlusBold.clock,
                                  color: Color(0xFFD63D9D),
                                  size: 20,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD63D9D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Duration To Input
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF5A626),
                              Color(0xFFEE3A8E),
                              Color(0xFF8944CD),
                              Color(0xFF5222E8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _durationToController,
                              readOnly: true,
                              onTap: _selectToTime,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Duration To",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _durationToError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                suffixIcon: const Icon(
                                  IconsaxPlusBold.clock,
                                  color: Color(0xFFD63D9D),
                                  size: 20,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD63D9D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Confirm Appointment Button
                  GradientButton(
                    text: "Confirm Appointment",
                    onPressed: () {
                      // Show congratulations popup
                      PopupHelper.showSuccess(
                        context: context,
                        title: "Congratulations!",
                        message: "Your appointment with ${_patientNameController.text.isNotEmpty ? _patientNameController.text : 'david warren'} is booked successfully",
                        buttonText: "Okay",
                        onButtonPressed: () {
                          Navigator.pushReplacementNamed(context, '/therapist_home');
                        },
                      );
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
}
