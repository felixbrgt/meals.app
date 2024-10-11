import 'package:flutter/material.dart'; // Import Flutter material package for UI components
import 'package:meals/models/meal.dart'; // Import the Meal model
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management
import 'package:meals/providers/favorites_provider.dart'; // Import the favorites provider
import 'package:meals/widgets/rating_widget.dart'; // Import the RatingWidget for meal rating

// Define the MealDetailsScreen widget that displays details of a meal
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key, // Key for widget identification
    required this.meal, // Required parameter for the meal data
  });

  final Meal meal; // Instance of Meal model containing meal data

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the favorite meals from the provider
    final favoriteMeals = ref.watch(favoritesMealsProvider);

    // Check if the current meal is a favorite
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title), // Display the meal title in the app bar
        actions: [
          IconButton(
            onPressed: () {
              // Toggle the favorite status of the meal
              final wasAdded = ref
                  .read(favoritesMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context)
                  .clearSnackBars(); // Clear existing snack bars
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added as a favorite.'
                      : 'Meal removed.'), // Show snack bar based on favorite status
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(
                  milliseconds: 300), // Animation duration for icon switch
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1)
                      .animate(animation), // Rotate the icon during transition
                  child: child,
                );
              },
              child: Icon(
                  isFavorite
                      ? Icons.star
                      : Icons
                          .star_border, // Show filled or outlined star based on favorite status
                  key:
                      ValueKey(isFavorite)), // Unique key for the animated icon
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id, // Tag for the Hero animation
              child: Image.network(
                meal.imageUrl, // Meal image from network
                height: 300, // Height of the image
                width: double.infinity, // Full width of the image
                fit: BoxFit.cover, // Cover the entire area
              ),
            ),
            const SizedBox(
                height: 14), // Space between the image and rating widget
            RatingWidget(
                mealId: meal.id), // Display the rating widget for the meal
            const SizedBox(
                height:
                    14), // Space between rating widget and ingredients section
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Style for ingredients title
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
            ),
            const SizedBox(
                height: 14), // Space between title and ingredient list
            for (final ingredient
                in meal.ingredients) // Iterate through ingredients
              Text(
                ingredient, // Display each ingredient
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground), // Style for ingredients
              ),
            const SizedBox(height: 24), // Space before steps section
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Style for steps title
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
            ),
            const SizedBox(height: 14), // Space between title and steps list
            for (final step in meal.steps) // Iterate through steps
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8), // Padding for each step
                child: Text(
                  step, // Display each step
                  textAlign: TextAlign.center, // Center align the text
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground), // Style for steps
                ),
              ),
          ],
        ),
      ),
    );
  }
}
