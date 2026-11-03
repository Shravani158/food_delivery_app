import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/features/loginandsignup/screens/login.dart';
import 'package:food_delivery_app/app/features/loginandsignup/screens/signup.dart';
import 'package:food_delivery_app/app/features/home/screens/home_screen.dart';
import 'package:food_delivery_app/app/features/onboarding/screen/onboarding_screen_1.dart';
import 'package:food_delivery_app/app/features/onboarding/screen/onboarding_screen_2.dart';
import 'package:food_delivery_app/app/features/splash/splash_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      scrollBehavior: const _AppScrollBehavior(),
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
        GetPage(
          name: '/home_screen',
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}
