import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/loginandsignup/login.dart';
import 'package:food_delivery_app/screens/loginandsignup/signup.dart';
import 'package:food_delivery_app/screens/onboarding/screen/onboarding_screen_1.dart';
import 'package:food_delivery_app/screens/onboarding/screen/onboarding_screen_2.dart';
import 'package:food_delivery_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/onboarding_screen_1',
          page: () => const Onboardingscreen1(),
        ),
        GetPage(
          name: '/onboarding_screen_2',
          page: () => const Onboardingscreen2(),
        ),
        GetPage(
          name: '/login',
          page: () => const Login(),
        ),
        GetPage(
          name: '/signup',
          page: () => const Signup(),
        ),
      ],
    );
  }
}
