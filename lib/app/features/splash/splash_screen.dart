import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/features/splash/splash_controller.dart';
import 'package:food_delivery_app/app/utils/constants/colors/Ucolors.dart';
import 'package:food_delivery_app/app/utils/images/Uimages.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SplashController>()) {
      Get.put(SplashController());
    }

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Ucolors.onboardingBg,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              Uimages.logo,
              width: 142,
              height: 140,
            ),
          ),
          Positioned(
            left: -10,
            bottom: -5,
            child: SizedBox(
              width: (screenWidth * 0.55).clamp(180.0, 240.0),
              child: Image.asset(
                Uimages.splashImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
