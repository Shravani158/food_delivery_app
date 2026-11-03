import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/app_text_fields.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_card.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_footer.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_logo_header.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/curved_header.dart';
import 'package:food_delivery_app/screens/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/utils/constants/textstyles/Utextstyles.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // The page is at least as tall as the screen (and at least 860)
    // so the card and bottom text always fit and scroll smoothly without overflowing.
    final pageHeight = math.max(MediaQuery.of(context).size.height, 860.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageHeight,
          child: Stack(
            children: [
              // 1. Pink curved background
              const CurvedHeader(height: 477),

              // 2. Logo + tagline (centered horizontally)
              const Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: AuthLogoHeader(),
              ),

              // 3. Signup card (32 px margin on both sides)
              Positioned(
                top: 310,
                left: 32,
                right: 32,
                child: AuthCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("SignUp", style: Utextstyles.onboardingTitle),
                      const SizedBox(height: 35),
                      const AppTextField(
                        hint: 'Name',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 16),
                      const AppTextField(
                        hint: 'example@gmail.com',
                        prefixIcon: Icons.mail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      const AppTextField(
                        hint: 'Password',
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        filled: true,
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        text: "Create account",
                        width: double.infinity,
                        onPressed: () {
                          Get.toNamed('/home_screen');
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              // 4. "Already have an account" at the bottom.
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: AuthFooter(
                  prompt: "Already have an account",
                  actionText: 'SignUp',
                  onTap: () => Get.toNamed('/login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
