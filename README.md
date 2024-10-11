Meals App

Overview:
-----------
The Meals App is a Flutter-based application designed to allow users to browse, explore, and filter meals across various categories. Users can view detailed meal information, manage favorites, and apply dietary filters such as gluten-free, vegan, and vegetarian meals.

Features:
-----------
1. **Meal Categories**:
   - Browse meals by categories (e.g., Hamburgers, German, Quick & Easy).
   - Select a category to view meals with information like cooking time, complexity, and cost.

2. **Meal Details**:
   - View detailed information on each meal, including ingredients and steps for preparation.
   - Mark/unmark meals as favorites.

3. **Favorite Meals**:
   - Access your favorite meals in a dedicated favorites section.
   - Toggle meals in and out of favorites with user notifications.

4. **Dietary Filters**:
   - Apply filters (e.g., Gluten-Free, Lactose-Free, Vegetarian, Vegan) to show only relevant meals.

5. **Responsive UI**:
   - The app is optimized for various screen sizes and provides a seamless user experience.

Installation:
--------------
1. Clone the repository:
   `git clone https://github.com/yourusername/meals_app.git`
   
2. Navigate to the project directory:
   `cd meals_app`

3. Install dependencies:
   `flutter pub get`

4. Run the app:
   `flutter run`

Technologies Used:
-------------------
- **Flutter**: Cross-platform mobile framework.
- **Dart**: Programming language.
- **Riverpod**: For state management.
- **StateNotifier**: Used for managing favorites and filters.

File Structure:
---------------
- `lib/models/`: Contains the data models for the categories, meals, and ratings.
- `lib/providers/`: Handles the state management for filters, favorites, and meal ratings.
- `lib/screens/`: Contains the UI screens for categories, meals, meal details, and filters.
- `lib/widgets/`: Contains reusable widgets for the UI (e.g., category grid, meal item).

Contributing:
--------------
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch-name`
3. Commit your changes: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature-branch-name`
5. Open a pull request.

License:
--------
This project is licensed under the NTNU License.


