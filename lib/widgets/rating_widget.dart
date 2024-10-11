import 'package:flutter/material.dart'; // Import Flutter material package for UI components
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management
import 'package:meals/models/meal_rating.dart'; // Import the MealRating model
import 'package:meals/providers/rating_provider.dart'; // Import the rating provider

// Define the RatingWidget that allows users to rate a meal
class RatingWidget extends ConsumerWidget {
  final String mealId; // Meal ID to link the rating

  const RatingWidget({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the ratings from the rating provider
    final ratings = ref.watch(ratingProvider);

    // Get the current rating for the specified meal
    final currentRating = ratings
        .firstWhere(
          (rating) =>
              rating.mealId == mealId, // Find the rating matching the meal ID
          orElse: () => MealRating(
              mealId: mealId,
              rating: 0), // Default to a new MealRating if not found
        )
        .rating;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row
        children: [
          // Button to decrease the rating
          IconButton(
            icon: const Icon(Icons.remove), // Icon for the remove button
            onPressed: () {
              // Decrease the rating if it's above 0
              if (currentRating > 0) {
                ref.read(ratingProvider.notifier).setRating(mealId,
                    currentRating - 1); // Update the rating in the provider
              }
            },
          ),
          // Row to display star icons based on the current rating
          Row(
            children: List.generate(10, (index) {
              return Icon(
                index < currentRating
                    ? Icons.star
                    : Icons
                        .star_border, // Filled star for current rating, outline for others
                color: Colors.white, // Color of the stars
              );
            }),
          ),
          // Button to increase the rating
          IconButton(
            icon: const Icon(Icons.add), // Icon for the add button
            onPressed: () {
              // Increase the rating if it's below 10
              if (currentRating < 10) {
                ref.read(ratingProvider.notifier).setRating(mealId,
                    currentRating + 1); // Update the rating in the provider
              }
            },
          ),
        ],
      ),
    );
  }
}
