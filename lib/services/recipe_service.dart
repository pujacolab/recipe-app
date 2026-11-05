import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';

class RecipeService {
  Future<List<Recipe>> fetchRecipes() async {
    final url = Uri.parse('https://dummyjson.com/recipes');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List recipesJson = data['recipes'];

      return recipesJson
          .map((item) => Recipe.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}