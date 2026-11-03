import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/app_text_fields.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_card.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_footer.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_logo_header.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/curved_header.dart';
import 'package:food_delivery_app/app/features/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/app/utils/constants/textstyles/Utextstyles.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final curveHeight = (size.height * 0.54).clamp(380.0, 477.0);
    final logoTop = (size.height * 0.09).clamp(50.0, 90.0);
    final cardTop = (curveHeight * 0.65).clamp(240.0, 310.0);
    final horizontalPadding = (size.width * 0.08).clamp(16.0, 32.0);
    final pageHeight = math.max(size.height, cardTop + 480.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageHeight,
          child: Stack(
            children: [
              // 1. Pink curved background
              CurvedHeader(height: curveHeight),

              // 2. Logo + tagline (centered horizontally)
              Positioned(
                top: logoTop,
                left: 0,
                right: 0,
                child: const AuthLogoHeader(),
              ),

              // 3. Signup card (responsive horizontal margin)
              Positioned(
                top: cardTop,
                left: horizontalPadding,
                right: horizontalPadding,
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
                bottom: (size.height * 0.04).clamp(24.0, 50.0),
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
