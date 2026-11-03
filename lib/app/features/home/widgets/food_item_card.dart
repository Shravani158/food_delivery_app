import 'package:flutter/material.dart';

import '../../../data/models/home/food_item_model.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem item;

  const FoodItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 125,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFDD),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: item.imageUrl.isNotEmpty
                ? Image.network(item.imageUrl, fit: BoxFit.contain)
                : const SizedBox(),
          ),

          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 3),

          Text(
            item.price,
            style: const TextStyle(
              color: Color(0xFFF51F78),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
