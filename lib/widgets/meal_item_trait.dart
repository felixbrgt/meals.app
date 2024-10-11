import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon; // Icon to represent the trait
  final String label; // Text label for the trait

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon representation of the trait
        Icon(
          icon,
          size: 17, // Icon size
          color: Colors.white, // Icon color
        ),
        const SizedBox(
          width: 6, // Space between icon and text
        ),
        // Text label for the trait
        Text(
          label,
          style: const TextStyle(color: Colors.white), // Text color
        ),
      ],
    );
  }
}
