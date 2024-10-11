import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

// Initial filter settings for the application
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

// Main screen for tab navigation
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0; // Index to keep track of the selected tab

  // Method to change the selected tab
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index; // Update the selected index
    });
  }

  // Method to navigate to different screens based on the identifier
  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // Close the drawer
    if (identifier == 'filters') {
      // If the filters screen is selected
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>
              const FiltersScreen(), // Navigate to the filters screen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the filtered meals provider to get available meals
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals, // Set active page to CategoriesScreen
    );
    var activePageTitle = 'Categories'; // Default title

    // Check if the Favorites tab is selected
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals, // Set active page to MealsScreen for favorites
      );
      activePageTitle = 'Your Favorites'; // Update title for favorites
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle), // Set the title of the app bar
      ),
      drawer: MainDrawer(
        onSelectScreen:
            _setScreen, // Pass the method to handle screen selection
      ),
      body: activePage, // Display the active page
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage, // Handle tab selection
        currentIndex: _selectedPageIndex, // Highlight the selected tab
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories'), // Tab for categories
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Favorites'), // Tab for favorites
        ],
      ),
    );
  }
}
