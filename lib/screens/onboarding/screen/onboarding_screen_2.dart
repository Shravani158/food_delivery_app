import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/onboarding/widgets/onboarding_page.dart';
import 'package:food_delivery_app/utils/images/Uimages.dart';
import 'package:get/get.dart';

class Onboardingscreen2 extends StatelessWidget {
  const Onboardingscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      baseImage: Uimages.onboardingBaseImage2,
      topImage: Uimages.onboardingTopImage2,
      title: "Foodie is Where Your Comfort Food Resides",
      subtitle: "Enjoy a fast and smooth food delivery at your doorstep",
      onNext: () => Get.toNamed('/login'),
    );
  }
}
