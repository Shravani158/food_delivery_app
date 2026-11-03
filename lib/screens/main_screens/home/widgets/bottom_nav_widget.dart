import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    const icons = [Icons.home, Icons.person, Icons.shopping_cart, Icons.chat];

    return Container(
      height: 54,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF51F78),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = controller.selectedNavIndex.value == index;

            return IconButton(
              onPressed: () {
                controller.changeNavIndex(index);
              },
              icon: Icon(icons[index], color: Colors.white, size: 25),
              style: IconButton.styleFrom(
                backgroundColor: isSelected
                    ? Colors.white.withOpacity(0.15)
                    : null,
              ),
            );
          }),
        ),
      ),
    );
  }
}
