import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_phobia/screens/components/custom_topbar.dart';
import 'package:my_phobia/screens/components/gradient_button.dart';

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
            title: "Add Payment Method",
            backgroundImage: "assets/images/home.png",
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  // Account Holder Name Input
                  _buildTextField(
                    controller: _accountHolderController,
                    label: "Account Holder Name",
                    hintText: "Enter Account Holder Name",
                    onChanged: _validateAccountHolder,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      LengthLimitingTextInputFormatter(50),
                    ],
                    errorText: _accountHolderError,
                  ),

                  const SizedBox(height: 20),

                  // Card Number Input
                  _buildTextField(
                    controller: _cardNumberController,
                    label: "Card Number",
                    hintText: "Enter Card No",
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
                    errorText: _cardNumberError,
                  ),

                  const SizedBox(height: 20),

                  // Card Expiry Date Input
                  _buildTextField(
                    controller: _expiryDateController,
                    label: "Card Expiry Date",
                    hintText: "MM/YY",
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
                    errorText: _expiryDateError,
                  ),

                  const SizedBox(height: 20),

                  // CVV Input
                  _buildTextField(
                    controller: _cvvController,
                    label: "CVV",
                    hintText: "Enter CVV",
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    onChanged: _validateCVV,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    errorText: _cvvError,
                  ),

                  const SizedBox(height: 60),

                  // Save Button
                  GradientButton(
                    text: "Save",
                    onPressed: _isFormValid() ? () {
                      // Format card number for display (last 4 digits)
                      String cardNumber = _cardNumberController.text.replaceAll(' ', '');
                      String last4 = cardNumber.length >= 4 ? cardNumber.substring(cardNumber.length - 4) : '4569';
                      
                      // Return card data to previous screen
                      Navigator.pop(context, {
                        'cardNumber': '**** **** **** $last4',
                        'accountHolder': _accountHolderController.text,
                        'expiryDate': _expiryDateController.text,
                        'cvv': _cvvController.text,
                      });
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    Function(String)? onChanged,
    String? errorText,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1.5,
                  color: Colors.transparent,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                ),
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.5),
                  ),
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                    onChanged: onChanged,
                    inputFormatters: inputFormatters,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF320F7D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
