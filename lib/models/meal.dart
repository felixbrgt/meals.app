// Enum representing the complexity level of a meal
enum Complexity {
  simple, // Indicates a meal that is easy to prepare
  challenging, // Indicates a meal that requires more skill or time
  hard, // Indicates a meal that is difficult to prepare
}

// Enum representing the affordability level of a meal
enum Affordability {
  affordable, // Indicates a meal that is budget-friendly
  pricey, // Indicates a meal that is somewhat expensive
  luxurious, // Indicates a meal that is very expensive
}

// Class representing a meal with various attributes
class Meal {
  // Constructor for the Meal class
  const Meal({
    required this.id, // Unique identifier for the meal
    required this.categories, // List of categories the meal belongs to
    required this.title, // Title or name of the meal
    required this.imageUrl, // URL to an image of the meal
    required this.ingredients, // List of ingredients needed for the meal
    required this.steps, // List of steps for preparing the meal
    required this.duration, // Duration of the meal preparation in minutes
    required this.complexity, // Complexity level of the meal (Complexity enum)
    required this.affordability, // Affordability level of the meal (Affordability enum)
    required this.isGlutenFree, // Indicates if the meal is gluten-free
    required this.isLactoseFree, // Indicates if the meal is lactose-free
    required this.isVegan, // Indicates if the meal is vegan
    required this.isVegetarian, // Indicates if the meal is vegetarian
  });

  final String id; // Meal ID
  final List<String> categories; // Categories for the meal
  final String title; // Meal title
  final String imageUrl; // Meal image URL
  final List<String> ingredients; // Ingredients for the meal
  final List<String> steps; // Steps for preparing the meal
  final int duration; // Duration of preparation
  final Complexity complexity; // Meal complexity level
  final Affordability affordability; // Meal affordability level
  final bool isGlutenFree; // Is the meal gluten-free?
  final bool isLactoseFree; // Is the meal lactose-free?
  final bool isVegan; // Is the meal vegan?
  final bool isVegetarian; // Is the meal vegetarian?
}
