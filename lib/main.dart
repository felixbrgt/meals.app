import 'package:flutter/material.dart'; // Import the Flutter Material library for UI components
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management

import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts for custom typography
import 'package:meals/screens/tabs.dart'; // Import the Tabs screen from the meals package

// Define a ThemeData object for the application theme
final theme = ThemeData(
  useMaterial3: true, // Use Material Design 3 for the app
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark, // Set the brightness to dark mode
    seedColor: const Color.fromARGB(
        255, 131, 57, 0), // Define the seed color for the color scheme
  ),
  textTheme: GoogleFonts.latoTextTheme(), // Apply Lato font for the text theme
);

// The main function, the entry point of the application
void main() {
  runApp(const ProviderScope(
    child:
        App(), // Wrap the app in a ProviderScope for Riverpod state management
  ));
}

// Define the main App widget
class App extends StatelessWidget {
  const App({super.key}); // Constructor for the App widget

  @override
  Widget build(BuildContext context) {
    // Build the MaterialApp with the defined theme and home screen
    return MaterialApp(
      theme: theme, // Apply the defined theme
      home: const TabsScreen(), // Set the home screen to TabsScreen
    );
  }
}
