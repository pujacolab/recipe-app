import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../models/recipe.dart';
import 'recipe_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes ❤️'),
        backgroundColor: Colors.orange,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          final List<Recipe> favoriteRecipes = provider.favorites;

          if (favoriteRecipes.isEmpty) {
            return const Center(
              child: Text(
                'No favorite recipes yet!',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: favoriteRecipes.length,
            itemBuilder: (context, index) {
              final recipe = favoriteRecipes[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    recipe.image,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                    const Icon(Icons.restaurant),
                  ),
                  title: Text(recipe.name),
                  subtitle: Text(recipe.cuisine),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      provider.toggleFavorite(recipe.id);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}