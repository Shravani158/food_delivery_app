import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/utils/constants/textstyles/Utextstyles.dart';

/// Reusable onboarding template widget to eliminate duplicate layout code
/// between Onboardingscreen1 and Onboardingscreen2 while keeping pixel-exact UI.
class OnboardingPage extends StatelessWidget {
  final String baseImage;
  final String topImage;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    required this.baseImage,
    required this.topImage,
    required this.title,
    required this.subtitle,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 10,
                    right: 20,
                    child: Image.asset(
                      baseImage,
                      cacheWidth: 800,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 10,
                    right: 20,
                    child: Image.asset(
                      topImage,
                      cacheWidth: 800,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 350,
              height: 80,
              child: Text(
                title,
                style: Utextstyles.onboardingTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 300,
              height: 40,
              child: Text(
                subtitle,
                style: Utextstyles.onboardingSubtitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100),
            AppButton(
              text: "Next",
              onPressed: onNext,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

