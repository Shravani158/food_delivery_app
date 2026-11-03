import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/features/onboarding/widgets/onboarding_page.dart';
import 'package:food_delivery_app/app/utils/images/Uimages.dart';
import 'package:get/get.dart';

class Onboardingscreen1 extends StatelessWidget {
  const Onboardingscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      baseImage: Uimages.onboardingBaseImage1,
      topImage: Uimages.onboardingTopImage1,
      title: "Track your Comfort Food here",
      subtitle:
          "Here You Can find a chef or dish for every taste and color. Enjoy!",
      onNext: () => Get.toNamed('/onboarding_screen_2'),
    );
  }
}
