import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title; // Optional title for the screen
  final List<Meal> meals; // List of meals to be displayed

  // Method to navigate to the MealDetailsScreen
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default content when no meals are available
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh Oh.....nothing here!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    // If there are meals, create a ListView to display them
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index], // Pass each meal to MealItem
          onSelectMeal: (meal) {
            selectMeal(context, meal); // Navigate to meal details
          },
        ),
      );
    }

    // If no title is provided, return the content directly
    if (title == null) {
      return content;
    }

    // Return the Scaffold with the app bar and body
    return Scaffold(
      appBar: AppBar(
        title: Text(title!), // Use the title if provided
      ),
      body: content,
    );
  }
}
