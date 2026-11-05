import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/recipe.dart';
import '../services/recipe_service.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeService _service = RecipeService();

  List<Recipe> _apiRecipes = [];
  List<Recipe> _customRecipes = [];

  Set<int> _favoriteIds = {};

  bool isLoading = false;
  String errorMessage = '';
  String searchQuery = '';

  List<Recipe> get recipes => [
    ..._apiRecipes,
    ..._customRecipes,
  ];

  List<Recipe> get favorites => recipes
      .where((recipe) => _favoriteIds.contains(recipe.id))
      .toList();

  List<Recipe> get filteredRecipes {
    if (searchQuery.isEmpty) return recipes;

    return recipes.where((recipe) {
      return recipe.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
    }).toList();
  }

  bool isFavorite(int id) => _favoriteIds.contains(id);

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    final customData = prefs.getString('custom_recipes');
    final favoriteData = prefs.getStringList('favorite_ids');

    if (customData != null) {
      final List decoded = jsonDecode(customData);

      _customRecipes = decoded
          .map((item) => Recipe.fromJson(item))
          .toList();
    }

    if (favoriteData != null) {
      _favoriteIds = favoriteData.map(int.parse).toSet();
    }

    notifyListeners();
  }

  Future<void> fetchRecipes() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      _apiRecipes = await _service.fetchRecipes();
    } catch (e) {
      errorMessage = 'Failed to load recipes: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  void searchRecipes(String query) {
    searchQuery = query;
    notifyListeners();
  }

  Future<void> addRecipe(Recipe recipe) async {
    _customRecipes.add(recipe);

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'custom_recipes',
      jsonEncode(
        _customRecipes.map((item) => item.toJson()).toList(),
      ),
    );

    notifyListeners();
  }

  Future<void> toggleFavorite(int id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'favorite_ids',
      _favoriteIds.map((id) => id.toString()).toList(),
    );

    notifyListeners();
  }
}