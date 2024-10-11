import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management
import 'package:meals/models/meal_rating.dart'; // Import the MealRating model

// Define RatingNotifier that manages a list of MealRating objects
class RatingNotifier extends StateNotifier<List<MealRating>> {
  RatingNotifier()
      : super([]); // Initialize the state with an empty list of MealRatings

  // Method to set or update the rating for a specific meal
  void setRating(String mealId, int rating) {
    state = [
      for (final r in state) // Iterate through current ratings
        if (r.mealId == mealId) // Check if the rating is for the specified meal
          MealRating(mealId: mealId, rating: rating) // Update the rating
        else
          r, // Keep the existing rating for other meals
      if (!state.any((r) =>
          r.mealId == mealId)) // Check if the meal doesn't exist in the ratings
        MealRating(
            mealId: mealId,
            rating: rating), // Add a new MealRating if it doesn't exist
    ];
  }
}

// Define the ratingProvider using StateNotifierProvider to provide access to RatingNotifier
final ratingProvider =
    StateNotifierProvider<RatingNotifier, List<MealRating>>((ref) {
  return RatingNotifier(); // Return a new instance of RatingNotifier
});
