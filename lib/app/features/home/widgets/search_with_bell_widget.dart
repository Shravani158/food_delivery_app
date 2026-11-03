import 'package:flutter/material.dart';

import 'search_bar_widget.dart';

class SearchWithBellWidget extends StatelessWidget {
  const SearchWithBellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchBarWidget()),
        const SizedBox(width: 12),
        Stack(
          children: [
            const Icon(
              Icons.notifications_none,
              color: Color(0xFFE91E78),
              size: 28,
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE91E78),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
