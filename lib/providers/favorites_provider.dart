import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management
import 'package:meals/models/meal.dart'; // Import the Meal model

// Define a notifier to manage the favorite meals' state
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // Initialize with an empty list of meals

  // Method to toggle the favorite status of a meal
  bool toggleMealFavoriteStatus(Meal meal) {
    // Check if the meal is already a favorite
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // If it is a favorite, remove it from the list and return false
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // If it is not a favorite, add it to the list and return true
      state = [...state, meal];
      return true;
    }
  }
}

// Define a provider for managing the state of favorite meals
final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier(); // Create an instance of FavoriteMealsNotifier
});
