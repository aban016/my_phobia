import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onDismiss;

  const CustomPopup({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonPressed,
    this.onDismiss,
  });

  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required String buttonText,
    VoidCallback? onButtonPressed,
    VoidCallback? onDismiss,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomPopup(
          title: title,
          description: description,
          buttonText: buttonText,
          onButtonPressed: onButtonPressed,
          onDismiss: onDismiss,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF320F7D), // Dark purple color
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // const SizedBox(height: 16),
            
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8E8E93), // Gray color
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Action Button
            Container(
              // margin: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  onButtonPressed?.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5222E8), // Purple color
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper class for common popup configurations
class PopupHelper {
  static void showSuccess({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    CustomPopup.show(
      context: context,
      title: title,
      description: message,
      buttonText: buttonText ?? "Okay",
      onButtonPressed: onButtonPressed,
    );
  }

  static void showError({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    CustomPopup.show(
      context: context,
      title: title,
      description: message,
      buttonText: buttonText ?? "Okay",
      onButtonPressed: onButtonPressed,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    CustomPopup.show(
      context: context,
      title: title,
      description: message,
      buttonText: buttonText ?? "Okay",
      onButtonPressed: onButtonPressed,
    );
  }

  static void showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText, // will be ignored now
    VoidCallback? onConfirm,
    VoidCallback? onCancel, // will be ignored now
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF320F7D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF777777),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Only Confirm Button (Cancel removed)
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onConfirm?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5222E8),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        confirmText ?? "Confirm",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
