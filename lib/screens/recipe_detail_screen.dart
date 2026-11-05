import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: Colors.orange,
        actions: [
          Consumer<RecipeProvider>(
            builder: (context, provider, child) {
              return IconButton(
                icon: Icon(
                  provider.isFavorite(recipe.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  provider.toggleFavorite(recipe.id);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const SizedBox(
                height: 230,
                child: Center(
                  child: Icon(Icons.restaurant, size: 60),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Cuisine: ${recipe.cuisine}'),
                  Text('Preparation: ${recipe.prepTimeMinutes} minutes'),
                  Text('Cooking: ${recipe.cookTimeMinutes} minutes'),
                  Text('Servings: ${recipe.servings}'),

                  const SizedBox(height: 20),

                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ...recipe.ingredients.map(
                        (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('• $ingredient'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ...recipe.instructions.asMap().entries.map(
                        (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        '${entry.key + 1}. ${entry.value}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}