import 'package:flutter/material.dart';
import '../widgets/search_with_bell_widget.dart';
import '../../../data/models/home/food_item_model.dart';
import '../widgets/app_header_widget.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/food_item_card.dart';

import '../widgets/section_title_widget.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String title;
  final List<FoodItem> items;

  const CategoryItemsScreen({
    super.key,
    required this.title,
    required this.items,
  });

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const AppHeaderWidget(),
              const SizedBox(height: 25),
             const SearchWithBellWidget(),
              const SizedBox(height: 25),
              SectionTitleWidget(title: title),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return FoodItemCard(item: items[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
