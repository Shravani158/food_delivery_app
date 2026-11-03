import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/utils/constants/colors/Ucolors.dart';

/// Reusable elevated card container used on Login and Signup screens.
class AuthCard extends StatelessWidget {
  final Widget child;

  const AuthCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Ucolors.cardShadow,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      child: child,
    );
  }
}

