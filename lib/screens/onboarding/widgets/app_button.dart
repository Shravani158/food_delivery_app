import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants/colors/Ucolors.dart';
import 'package:food_delivery_app/utils/constants/textstyles/Utextstyles.dart';

/// Reusable primary button (used across onboarding, login, and signup).
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Ucolors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: Utextstyles.buttonText,
        ),
      ),
    );
  }
}
