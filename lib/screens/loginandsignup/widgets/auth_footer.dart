import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants/textstyles/Utextstyles.dart';

/// Reusable prompt and link button at the bottom of the auth screens.
class AuthFooter extends StatelessWidget {
  final String prompt;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooter({
    super.key,
    required this.prompt,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          prompt,
          style: Utextstyles.authPrompt,
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: Utextstyles.authAction,
          ),
        ),
      ],
    );
  }
}

