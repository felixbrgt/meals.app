import 'package:flutter/material.dart'; // Import the Flutter material package for UI components
import 'package:meals/data/dummy_data.dart'; // Import dummy data for categories and meals
import 'package:meals/screens/meals.dart'; // Import the MealsScreen to display meals by category
import 'package:meals/widgets/category_grid_item.dart'; // Import the widget to display individual category items
import 'package:meals/models/category.dart'; // Import the Category model
import 'package:meals/models/meal.dart'; // Import the Meal model

// Define the CategoriesScreen which displays a grid of meal categories
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      required this.availableMeals}); // Constructor requires a list of available meals

  final List<Meal>
      availableMeals; // List of available meals passed to the screen

  @override
  State<CategoriesScreen> createState() =>
      _CategoriesScreenState(); // Create the state for this screen
}

// State class for CategoriesScreen
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _animationController; // Animation controller for managing animations

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this, // Set the vsync provider for smoother animations
      duration: const Duration(milliseconds: 300), // Set animation duration
      lowerBound: 0, // Lower bound of the animation
      upperBound: 1, // Upper bound of the animation
    );

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  // Method to handle category selection
  void _selectedCategory(BuildContext context, Category category) {
    // Filter meals based on selected category
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigate to MealsScreen with the filtered meals
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, // Pass category title to the MealsScreen
          meals: filteredMeals, // Pass filtered meals to the MealsScreen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI with an animated grid of categories
    return AnimatedBuilder(
      animation:
          _animationController, // Use the animation controller for building
      child: GridView(
        padding: const EdgeInsets.all(24), // Padding around the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          childAspectRatio: 3 / 2, // Aspect ratio of each grid item
          crossAxisSpacing: 20, // Horizontal spacing between items
          mainAxisSpacing: 20, // Vertical spacing between items
        ),
        children: [
          // Create a grid item for each category
          for (final category in availableCategories)
            CategoryGridItem(
              category: category, // Pass the category to the grid item
              onSelectedCategory: () {
                _selectedCategory(
                    context, category); // Handle category selection
              },
            )
        ],
      ),
      // Define the animation transition for the grid items
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3), // Start position for the slide
          end: const Offset(0, 0), // End position for the slide
        ).animate(
          CurvedAnimation(
            parent: _animationController, // Use the animation controller
            curve: Curves.easeInOut, // Define the animation curve
          ),
        ),
        child: child, // Child is the grid view
      ),
    );
  }
}
