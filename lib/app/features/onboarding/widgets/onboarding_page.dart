import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/features/onboarding/widgets/app_button.dart';
import 'package:food_delivery_app/app/utils/constants/textstyles/Utextstyles.dart';

/// Reusable responsive onboarding template widget that adjusts smoothly to any device size.
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
    final size = MediaQuery.of(context).size;
    final imageHeight = (size.height * 0.52).clamp(320.0, 500.0);
    final topOffset = (imageHeight * 0.16).clamp(40.0, 80.0);
    final secondOffset = (imageHeight * 0.30).clamp(70.0, 150.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: imageHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: topOffset,
                      left: 10,
                      right: 20,
                      child: Image.asset(
                        baseImage,
                        cacheWidth: 800,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: secondOffset,
                      left: 10,
                      right: 20,
                      child: Image.asset(
                        topImage,
                        cacheWidth: 800,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: (size.height * 0.04).clamp(16.0, 40.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  title,
                  style: Utextstyles.onboardingTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: (size.height * 0.015).clamp(8.0, 14.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Text(
                  subtitle,
                  style: Utextstyles.onboardingSubtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: (size.height * 0.05).clamp(24.0, 60.0)),
              AppButton(
                text: "Next",
                onPressed: onNext,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
