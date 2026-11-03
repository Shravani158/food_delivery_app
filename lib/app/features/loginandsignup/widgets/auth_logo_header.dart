import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/utils/constants/textstyles/Utextstyles.dart';
import 'package:food_delivery_app/app/utils/images/Uimages.dart';

/// Centered white logo and tagline used in the header of Login and Signup screens.
class AuthLogoHeader extends StatelessWidget {
  const AuthLogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset(Uimages.whiteLogo, fit: BoxFit.cover),
        ),
        const SizedBox(height: 15),
        const Text(
          'Deliver Favourite Food',
          style: Utextstyles.loginSubtitle,
        ),
      ],
    );
  }
}
