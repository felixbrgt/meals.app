import 'package:flutter/material.dart';

class Category {
  // Constructor for Category class
  const Category({
    required this.id, // Unique identifier for the category
    required this.title, // Display title of the category
    this.color = Colors.orange, // Optional color, default is orange
  });

  final String id; // Unique identifier for the category
  final String title; // Title of the category
  final Color color; // Color associated with the category
}
