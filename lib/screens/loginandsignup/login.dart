import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/app_text_fields.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_card.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_footer.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/auth_logo_header.dart';
import 'package:food_delivery_app/screens/loginandsignup/widgets/curved_header.dart';
import 'package:food_delivery_app/screens/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/utils/constants/textstyles/Utextstyles.dart';
import 'package:food_delivery_app/utils/icons/Uicons.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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

              // 3. Login card (32 px margin on both sides)
              Positioned(
                top: 310,
                left: 32,
                right: 32,
                child: AuthCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Login", style: Utextstyles.onboardingTitle),
                      const SizedBox(height: 35),
                      const AppTextField(
                        hint: 'example@gmail.com',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      const AppTextField(
                        hint: 'Password',
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        filled: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: Utextstyles.forgetPassword,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        text: "Login",
                        width: double.infinity,
                        onPressed: () {
                          Get.toNamed('/home_screen');
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Or',
                        style: Utextstyles.orDivider,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              Uicons.googleIcon,
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              Uicons.facebookIcon,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 4. "Don't have an account?" at the bottom.
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: AuthFooter(
                  prompt: "Don't have an account?",
                  actionText: 'REGISTER',
                  onTap: () => Get.toNamed('/signup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
