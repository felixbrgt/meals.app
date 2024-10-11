// Import necessary Flutter packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Import the Category model
import 'package:meals/models/category.dart';

// Stateless widget representing a grid item for a category
class CategoryGridItem extends StatelessWidget {
  // Constructor for the CategoryGridItem widget
  const CategoryGridItem({
    super.key, // Unique key for the widget
    required this.category, // Required category object
    required this.onSelectedCategory, // Callback function when the category is selected
  });

  final Category category; // The category to display
  final void Function()
      onSelectedCategory; // Function to call on category selection

  @override
  Widget build(BuildContext context) {
    // Build method to create the UI for the category grid item
    return InkWell(
      onTap: onSelectedCategory, // Trigger callback on tap
      splashColor: Theme.of(context).primaryColor, // Splash color on tap
      borderRadius:
          BorderRadius.circular(16), // Rounded corners for the ink well
      child: Container(
        padding: const EdgeInsets.all(16), // Padding inside the container
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(16), // Rounded corners for the container
          gradient: LinearGradient(
            // Gradient background
            colors: [
              category.color
                  .withOpacity(0.55), // Lightened color for the gradient
              category.color
                  .withOpacity(0.9), // Darkened color for the gradient
            ],
            begin: Alignment.topLeft, // Gradient starts from the top left
            end: Alignment.bottomRight, // Gradient ends at the bottom right
          ),
        ),
        child: Text(
          category.title, // Display the category title
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // Text style
                color: Theme.of(context).colorScheme.onBackground, // Text color
              ),
        ),
      ),
    );
  }
}
