// Class to represent the rating of a meal
class MealRating {
  final String mealId; // Unique identifier for the meal
  int rating; // Rating value for the meal, initialized to 0 by default

  // Constructor to initialize MealRating with required mealId and optional rating
  MealRating({required this.mealId, this.rating = 0});
}
