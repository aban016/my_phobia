import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';
import 'package:my_phobia/screens/components/custom_popup.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  
  String? _accountHolderError;
  String? _cardNumberError;
  String? _expiryDateError;
  String? _cvvError;

  @override
  void dispose() {
    _accountHolderController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _validateAccountHolder(String value) {
    if (value.isEmpty) {
      setState(() {
        _accountHolderError = "Account holder name is required";
      });
    } else if (value.length < 2) {
      setState(() {
        _accountHolderError = "Name must be at least 2 characters";
      });
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      setState(() {
        _accountHolderError = "Name can only contain letters and spaces";
      });
    } else {
      setState(() {
        _accountHolderError = null;
      });
    }
  }

  void _validateCardNumber(String value) {
    // Remove spaces and non-digits
    String cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cleanValue.isEmpty) {
      setState(() {
        _cardNumberError = "Card number is required";
      });
    } else if (cleanValue.length < 13) {
      setState(() {
        _cardNumberError = "Card number must be at least 13 digits";
      });
    } else if (cleanValue.length > 19) {
      setState(() {
        _cardNumberError = "Card number cannot exceed 19 digits";
      });
    } else {
      setState(() {
        _cardNumberError = null;
      });
    }
  }

  void _validateExpiryDate(String value) {
    if (value.isEmpty) {
      setState(() {
        _expiryDateError = "Expiry date is required";
      });
    } else if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
      setState(() {
        _expiryDateError = "Please enter date in MM/YY format";
      });
    } else {
      setState(() {
        _expiryDateError = null;
      });
    }
  }

  void _validateCVV(String value) {
    if (value.isEmpty) {
      setState(() {
        _cvvError = "CVV is required";
      });
    } else if (value.length < 3) {
      setState(() {
        _cvvError = "CVV must be at least 3 digits";
      });
    } else if (value.length > 4) {
      setState(() {
        _cvvError = "CVV cannot exceed 4 digits";
      });
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      setState(() {
        _cvvError = "CVV can only contain numbers";
      });
    } else {
      setState(() {
        _cvvError = null;
      });
    }
  }

  String _formatCardNumber(String value) {
    // Remove all non-digits
    String cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');
    
    // Add spaces every 4 digits
    String formatted = '';
    for (int i = 0; i < cleanValue.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += cleanValue[i];
    }
    
    return formatted;
  }

  String _formatExpiryDate(String value) {
    // Remove all non-digits
    String cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cleanValue.length >= 2) {
      return '${cleanValue.substring(0, 2)}/${cleanValue.substring(2)}';
    }
    return cleanValue;
  }

  bool _isFormValid() {
    return _accountHolderError == null &&
           _cardNumberError == null &&
           _expiryDateError == null &&
           _cvvError == null &&
           _accountHolderController.text.isNotEmpty &&
           _cardNumberController.text.isNotEmpty &&
           _expiryDateController.text.isNotEmpty &&
           _cvvController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomTopBar(
            title: "Add New Card",
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
                  
                  // Account Holder Name Input
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
                              controller: _accountHolderController,
                              onChanged: _validateAccountHolder,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                                LengthLimitingTextInputFormatter(50),
                              ],
                              decoration: InputDecoration(
                                hintText: "Account Holder Name",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _accountHolderError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
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

                  // Card Number Input
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
                              controller: _cardNumberController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String formatted = _formatCardNumber(value);
                                if (formatted != value) {
                                  _cardNumberController.value = TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(offset: formatted.length),
                                  );
                                }
                                _validateCardNumber(formatted);
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(23), // 19 digits + 4 spaces
                              ],
                              decoration: InputDecoration(
                                hintText: "Enter Card No",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _cardNumberError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
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

                  // Card Expiry Date Input
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
                              controller: _expiryDateController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String formatted = _formatExpiryDate(value);
                                if (formatted != value) {
                                  _expiryDateController.value = TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(offset: formatted.length),
                                  );
                                }
                                _validateExpiryDate(formatted);
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4), // MMYY
                              ],
                              decoration: InputDecoration(
                                hintText: "Card Expiry Date (MM/YY)",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _expiryDateError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
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

                  // CVV Input
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
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              onChanged: _validateCVV,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: InputDecoration(
                                hintText: "Enter CVV",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD63D9D),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: _cvvError,
                                errorStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
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

                  // Save Button
                  GradientButton(
                    text: "Save",
                    onPressed: _isFormValid() ? () {
                      // Show congratulations popup
                      PopupHelper.showSuccess(
                        context: context,
                        title: "Congratulations!",
                        message: "Your appointment request has been sent successfully with David Warren this week at 04:00 PM To 05:00 PM",
                        buttonText: "Okay",
                        onButtonPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      );
                    } : null,
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
