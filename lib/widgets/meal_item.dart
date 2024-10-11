import 'package:flutter/widgets.dart'; // Import Flutter widgets for UI components
import 'package:meals/models/meal.dart'; // Import the Meal model
import 'package:flutter/material.dart'; // Import Flutter material package for additional UI components
import 'package:transparent_image/transparent_image.dart'; // Import for using transparent images as placeholders
import 'package:meals/widgets/meal_item_trait.dart'; // Import the MealItemTrait widget for displaying traits of meals

// Define the MealItem widget which displays details of a single meal
class MealItem extends StatelessWidget {
  const MealItem({
    super.key, // Key for widget identification
    required this.meal, // Required parameter for the meal data
    required this.onSelectMeal, // Callback function for selecting the meal
  });

  final Meal meal; // Instance of Meal model containing meal data
  final void Function(Meal meal)
      onSelectMeal; // Function to handle meal selection

  // Getter to format the complexity text
  String get complexityText {
    return meal.complexity.name[0]
            .toUpperCase() + // Capitalize the first letter
        meal.complexity.name.substring(1); // Append the rest of the string
  }

  // Getter to format the affordability text
  String get affordabilityText {
    return meal.affordability.name[0]
            .toUpperCase() + // Capitalize the first letter
        meal.affordability.name.substring(1); // Append the rest of the string
  }

  @override
  Widget build(BuildContext context) {
    // Build method for the widget
    return Card(
      margin: const EdgeInsets.all(8), // Margin around the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners for the card
      ),
      clipBehavior: Clip.hardEdge, // Clip behavior for the card edges
      elevation: 2, // Elevation of the card for shadow effect
      child: InkWell(
        onTap: () {
          onSelectMeal(meal); // Invoke the callback when the card is tapped
        },
        child: Stack(children: [
          Hero(
            tag: meal.id, // Tag for the Hero animation
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage), // Placeholder image
              image: NetworkImage(meal.imageUrl), // Meal image from network
              fit: BoxFit.cover, // Cover the entire card area
              height: 200, // Height of the image
              width: double.infinity, // Full width of the card
            ),
          ),
          Positioned(
            bottom: 0, // Position the container at the bottom
            left: 0, // Align to the left
            right: 0, // Align to the right
            child: Container(
              color: Colors.black54, // Semi-transparent background
              padding: const EdgeInsets.symmetric(
                  vertical: 6, horizontal: 44), // Padding inside the container
              child: Column(
                children: [
                  Text(
                    meal.title, // Meal title
                    maxLines: 2, // Limit to 2 lines
                    textAlign: TextAlign.center, // Center the text
                    softWrap: true, // Allow soft wrapping
                    overflow:
                        TextOverflow.ellipsis, // Show ellipsis for overflow
                    style: const TextStyle(
                      fontSize: 20, // Font size for the title
                      fontWeight: FontWeight.bold, // Bold font weight
                      color: Colors.white, // Text color
                    ),
                  ),
                  const SizedBox(height: 12), // Space between title and traits
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row
                    children: [
                      MealItemTrait(
                        icon: Icons.schedule, // Icon for duration
                        label: '${meal.duration} min', // Duration label
                      ),
                      const SizedBox(
                        height: 12, // Space between items
                      ),
                      MealItemTrait(
                        icon: Icons.work, // Icon for complexity
                        label: complexityText, // Complexity label
                      ),
                      const SizedBox(
                        height: 12, // Space between items
                      ),
                      MealItemTrait(
                        icon: Icons.attach_money, // Icon for affordability
                        label: affordabilityText, // Affordability label
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
