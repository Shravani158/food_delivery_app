import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/app_text_fields.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_card.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_footer.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/auth_logo_header.dart';
import 'package:food_delivery_app/app/features/loginandsignup/widgets/curved_header.dart';
import 'package:food_delivery_app/app/features/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/app/utils/constants/textstyles/Utextstyles.dart';
import 'package:food_delivery_app/app/utils/icons/Uicons.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final curveHeight = (size.height * 0.54).clamp(380.0, 477.0);
    final logoTop = (size.height * 0.09).clamp(50.0, 90.0);
    final cardTop = (curveHeight * 0.65).clamp(240.0, 310.0);
    final horizontalPadding = (size.width * 0.08).clamp(16.0, 32.0);
    final pageHeight = math.max(size.height, cardTop + 540.0);

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

              // 3. Login card (responsive horizontal margin)
              Positioned(
                top: cardTop,
                left: horizontalPadding,
                right: horizontalPadding,
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
                bottom: (size.height * 0.04).clamp(24.0, 50.0),
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
