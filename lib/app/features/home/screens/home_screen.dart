import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../data/models/home/home_food_data.dart';
import 'category_items_screen.dart';

import '../widgets/deal_banner_widget.dart';
import '../widgets/food_section_widget.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/app_header_widget.dart';
import '../widgets/search_with_bell_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: BottomNavWidget(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const AppHeaderWidget(),
              const SizedBox(height: 25),
              const SearchWithBellWidget(),
              const SizedBox(height: 25),
              const DealBannerWidget(),
              const SizedBox(height: 20),
              FoodSectionWidget(
                title: 'Popular Menu',
                items: HomeFoodData.popularItems,
                onViewMore: () {
                  Get.to(
                    () => const CategoryItemsScreen(
                      title: 'Popular Menu',
                      items: HomeFoodData.popularItems,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FoodSectionWidget(
                title: 'Desserts',
                items: HomeFoodData.desserts,
                onViewMore: () {
                  Get.to(
                    () => const CategoryItemsScreen(
                      title: 'Desserts',
                      items: HomeFoodData.desserts,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FoodSectionWidget(
                title: 'Main Course',
                items: HomeFoodData.mainCourse,
                onViewMore: () {
                  Get.to(
                    () => const CategoryItemsScreen(
                      title: 'Main Course',
                      items: HomeFoodData.mainCourse,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FoodSectionWidget(
                title: 'Snacks',
                items: HomeFoodData.snacks,
                onViewMore: () {
                  Get.to(
                    () => const CategoryItemsScreen(
                      title: 'Snacks',
                      items: HomeFoodData.snacks,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
