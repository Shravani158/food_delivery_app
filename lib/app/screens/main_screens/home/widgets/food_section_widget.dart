import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/data/models/home/food_item_model.dart';
import 'package:food_delivery_app/app/features/home/widgets/food_item_card.dart';

// ignore: unused_import
import 'food_item_card.dart';

class FoodSectionWidget extends StatelessWidget {
  final String title;
  final List<FoodItem> items;
  final VoidCallback onViewMore;

  const FoodSectionWidget({
    super.key,
    required this.title,
    required this.items,
    required this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: onViewMore,
              child: const Text(
                'View More',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Horizontal scrolling list
        SizedBox(
          height: 135,
          width: double.infinity,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
              },
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Row(
                children: [
                  for (int i = 0; i < items.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                        right: i == items.length - 1 ? 0 : 16,
                      ),
                      child: SizedBox(
                        width: 150,
                        child: FoodItemCard(item: items[i]),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
