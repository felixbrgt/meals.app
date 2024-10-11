import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

// Enum to represent different meal filters
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

// Notifier to manage meal filters
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  // Initializes the filters with all set to false
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  // Method to set multiple filters at once
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // Method to set a specific filter's active status
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state, // Spread operator to retain existing filters
      filter: isActive, // Update the specific filter
    };
  }
}

// Provider to access FiltersNotifier
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

// Provider to filter meals based on active filters
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider); // Get all meals
  final activeFilters = ref.watch(filtersProvider); // Get active filters

  return meals.where((meal) {
    // Check each filter and return only meals that meet the criteria
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false; // Meal is not gluten-free
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false; // Meal is not lactose-free
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false; // Meal is not vegetarian
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false; // Meal is not vegan
    }
    return true; // Meal passes all filters
  }).toList(); // Convert the filtered meals to a list
});
