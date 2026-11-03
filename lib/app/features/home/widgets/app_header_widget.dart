import 'package:flutter/material.dart';

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Find Your\nFavourite Food',
      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, height: 1.2),
    );
  }
}
