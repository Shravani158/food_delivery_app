import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../data/home_food_data.dart';
import 'category_items_screen.dart';

import '../widgets/search_bar_widget.dart';
import '../widgets/deal_banner_widget.dart';
import '../widgets/food_section_widget.dart';
import '../widgets/bottom_nav_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Find Your\nFavourite Food',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const SearchBarWidget(),

                  const SizedBox(height: 25),

                  const DealBannerWidget(),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Only food sections are scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    FoodSectionWidget(
                      title: 'Popular Menu',
                      items: HomeFoodData.popularItems,
                      onViewMore: () {
                        Get.to(
                          () => CategoryItemsScreen(
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
                          () => CategoryItemsScreen(
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
                          () => CategoryItemsScreen(
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
                          () => CategoryItemsScreen(
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

            // Fixed Bottom Navigation
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: BottomNavWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
