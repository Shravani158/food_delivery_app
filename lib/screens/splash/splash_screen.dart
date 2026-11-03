import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/screens/splash/splash_controller.dart';
import 'package:food_delivery_app/utils/constants/colors/Ucolors.dart';
import 'package:food_delivery_app/utils/images/Uimages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SplashController>()) {
      Get.put(SplashController());
    }

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
            right: 150,
            top: 600,
            bottom: -5,
            child: Image.asset(
              Uimages.splashImage,
            ),
          ),
        ],
      ),
    );
  }
}
