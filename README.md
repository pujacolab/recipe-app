# Recipe App – Flutter Recipe Management Application

## Project Overview

Recipe App is a Flutter-based Android application developed as a college group project by a team of three students.

The application allows users to discover online recipes, search for recipes, view complete cooking instructions, create their own recipes, and manage favourite recipes.

The project demonstrates Flutter UI development, Provider state management, REST API integration, JSON parsing, SharedPreferences local storage, form validation, and GitHub collaboration.

## Features

1. **Online Recipes:** Retrieves recipes from the DummyJSON Recipes API.
2. **Recipe Search:** Allows users to search recipes by name.
3. **Recipe Details:** Displays recipe images, cuisine, preparation time, cooking time, servings, ingredients, and instructions.
4. **Favourite Recipes:** Allows users to add and remove favourite recipes.
5. **Add Custom Recipes:** Users can create their own recipes with ingredients and cooking instructions.
6. **Form Validation:** Validates required fields and numeric inputs.
7. **Local Storage:** Saves custom recipes and favourite IDs using SharedPreferences.
8. **Loading Indicator:** Displays loading progress while fetching recipes.
9. **Error Handling:** Displays an error message and Retry button when online recipes cannot be loaded.
10. **Empty State:** Displays messages when no search results or favourite recipes are available.
11. **Image Error Handling:** Displays a fallback restaurant icon when recipe images fail to load.
12. **Material 3 UI:** Uses an orange-themed interface with consistent styling.

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Android application development |
| Dart | Programming language |
| Provider | State management |
| ChangeNotifier | Updating application state |
| DummyJSON API | Online recipe data |
| HTTP | API requests |
| SharedPreferences | Local data storage |
| JSON | Data serialization and parsing |
| Android Studio | Development and testing |
| Git and GitHub | Version control and collaboration |

## Application Screens

The application contains four main functional screens.

### 1. Home Screen

<img width="417" height="861" alt="image" src="https://github.com/user-attachments/assets/75bba999-9ad7-43dd-800a-c42edf37b123" />

### 2. Add Recipe Screen

<img width="420" height="836" alt="image" src="https://github.com/user-attachments/assets/7c5f1ebf-f9d3-46ae-bad0-22cd7b34f258" />

### 3. Recipe Detail Screen

<img width="391" height="851" alt="image" src="https://github.com/user-attachments/assets/f37e677e-894e-4183-97f1-5f1b5331496f" />


### 4. Favourite Recipes Screen

<img width="400" height="847" alt="image" src="https://github.com/user-attachments/assets/9b7e0f32-3bd5-4ecb-9b62-00fbc0a62d67" />


## Project Structure

```text
lib/
├── main.dart
├── models/
│   └── recipe.dart
├── providers/
│   └── recipe_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── add_recipe_screen.dart
│   ├── recipe_detail_screen.dart
│   └── favorite_screen.dart
├── services/
│   └── recipe_service.dart
└── widgets/
```

### Description of Project Files

**main.dart**
- Initializes the Flutter application.
- Configures Provider.
- Loads saved data.
- Fetches online recipes.
- Configures the Material 3 orange theme.

**models/recipe.dart**
- Defines the Recipe model.
- Contains recipe properties.
- Converts JSON into Recipe objects.
- Converts Recipe objects into JSON.

**providers/recipe_provider.dart**
- Manages application state.
- Fetches online recipes.
- Manages custom recipes.
- Handles searching and filtering.
- Manages favourite recipes.
- Saves and retrieves local data.

**services/recipe_service.dart**
- Connects to the DummyJSON API.
- Sends HTTP GET requests.
- Parses JSON responses.
- Converts API results into Recipe objects.

**screens/home_screen.dart**
- Displays recipes.
- Provides search functionality.
- Navigates to recipe details.
- Provides access to favourites and adding recipes.

**screens/add_recipe_screen.dart**
- Provides the custom recipe form.
- Validates user inputs.
- Saves custom recipes.

**screens/recipe_detail_screen.dart**
- Displays complete recipe information.
- Shows ingredients and instructions.
- Provides favourite functionality.

**screens/favorite_screen.dart**
- Displays favourite recipes.
- Allows users to remove favourite selections.

## Data Source and Storage

Recipe App uses the DummyJSON Recipes API to retrieve online recipe information.

API Website: https://dummyjson.com/

API Endpoint:

```text
https://dummyjson.com/recipes
```

The application uses the HTTP package to send GET requests and retrieve recipe data.

The JSON response is decoded using Dart's `dart:convert` library and converted into Recipe model objects.

### Local Data Storage

SharedPreferences is used to store custom recipes and favourite recipe IDs.

The application stores:

- Custom recipes using the `custom_recipes` key.
- Favourite recipe IDs using the `favorite_ids` key.

Custom recipes are serialized into JSON before storage. Previously saved information is loaded when the application starts.

## State Management

The application uses Provider with ChangeNotifier.

The RecipeProvider class manages:

- Online recipe data.
- Custom recipe data.
- Favourite recipe IDs.
- Search queries.
- Loading states.
- API error messages.

The `notifyListeners()` method updates the UI whenever application data changes.

Consumer and `context.read()` are used to access provider data and perform application operations.

## Installation and Setup

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android SDK
- Android emulator or physical Android device
- Internet connection for online recipes

### Clone the Repository

```bash
git clone https://github.com/pujacolab/recipe-app.git
cd recipe-app
```

### Install Dependencies

```bash
flutter pub get
```

### Run the Application

```bash
flutter run
```

### Run Code Analysis

```bash
flutter analyze
```

### Run Automated Tests

```bash
flutter test
```

### Build Release APK

```bash
flutter build apk --release
```

Generated APK location:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Team Members and Contributions

The Recipe App was developed collaboratively by three students.

| Team Member | College ID | Contributions |
|---|---|---|
| Team Leader | 248x1a42i7 | Project setup, API integration, Provider implementation, application architecture, data management, project integration and GitHub repository management |
| Member 1 | 248x1a42g8 | Home Screen UI, recipe listing, search functionality, Recipe Detail Screen and navigation |
| Member 2 | 24x1a42f9 | Add Recipe Screen, form validation, Favourite Recipes Screen and UI improvements |

*Note: The contribution allocation above is a proposed division based on the implemented modules. Confirm individual ownership before final submission.*

## GitHub Repository

Repository:

https://github.com/pujacolab/recipe-app

GitHub was used to maintain the project source code and track development changes.

The team can use commits, branches, and Pull Requests to collaborate and integrate application features.

## Testing and Validation

The following test cases can be used to validate the application.

| Test Case | Expected Result |
|---|---|
| Launch application | Home Screen opens |
| Fetch online recipes | Recipes load from API |
| Search recipes | Matching recipes appear |
| Search unavailable recipe | No recipes found message |
| Open recipe | Complete details displayed |
| Add favourite | Recipe appears in favourites |
| Remove favourite | Recipe disappears from favourites |
| Restart application | Saved favourites are restored |
| Add custom recipe | Recipe saved locally |
| Submit empty fields | Validation messages appear |
| Enter invalid numeric values | Validation messages appear |
| Open empty favourites | Empty-state message appears |
| Disable Internet | API error state appears |
| Press Retry | Another API request is attempted |
| Load invalid image | Fallback icon appears |

Note: These are test scenarios derived from the implementation. Actual execution results should be recorded after testing.

## Error Handling

The application includes handling for:

- Failed online recipe requests.
- Unsuccessful API responses.
- Empty recipe search results.
- Missing required form inputs.
- Invalid numeric inputs.
- Failed recipe image loading.
- Empty favourite recipe lists.
- Custom recipe saving errors.

Users receive appropriate messages or fallback UI when supported operations cannot be completed.

## Known Limitations

- Online recipes require Internet connectivity.
- Recipe retrieval depends on DummyJSON API availability.
- Custom recipes are stored locally on the device.
- Custom recipes are not synchronized across devices.
- Recipe search currently filters by recipe name.
- Custom recipe images are entered using image URLs.
- Recipe editing and deletion are not included in the reviewed implementation.
- Recipe data is retrieved from a predefined API endpoint.

## Release APK

The Android release APK can be generated using:

```bash
flutter build apk --release
```

**Generated APK location:**

```text
build/app/outputs/flutter-apk/app-release.apk
```

**APK Download:**

### Download APK

[Download Recipe App v1.0.0](https://github.com/pujacolab/recipe-app/releases/tag/v1.0.0?utm_source=chatgpt.com) ❤️
## Future Enhancements

- Additional recipe categories.
- Recipe filtering by cuisine.
- Recipe difficulty selection.
- Editing custom recipes.
- Deleting custom recipes.
- Recipe ratings and reviews.
- Cooking time filters.
- Improved offline recipe availability.
- User authentication.
- Cloud synchronization.
- Improved accessibility and UI design.

## Conclusion

Recipe App demonstrates the development of a Flutter-based recipe discovery and management application using Provider state management, REST API integration, JSON parsing, and persistent local storage.

The application allows users to discover online recipes, search for recipes, view complete cooking instructions, manage favourite recipes, and create their own custom recipes.

The project demonstrates important mobile application development concepts, including Flutter UI development, state management, API communication, data persistence, form validation, and screen navigation.

Overall, Recipe App provides a practical example of building a recipe discovery and management application using Flutter and Dart.
