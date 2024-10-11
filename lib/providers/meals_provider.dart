import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// Provider to expose a list of meals
final mealsProvider = Provider((ref) {
  // Returns the list of dummy meals defined in dummy_data.dart
  return dummyMeals;
});
