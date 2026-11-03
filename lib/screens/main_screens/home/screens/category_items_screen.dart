import 'package:flutter/material.dart';

import '../models/food_item_model.dart';
import '../widgets/food_item_card.dart';

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
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
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
    );
  }
}
