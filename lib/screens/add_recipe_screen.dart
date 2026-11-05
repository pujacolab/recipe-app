import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final cuisineController = TextEditingController();
  final prepController = TextEditingController();
  final cookController = TextEditingController();
  final servingsController = TextEditingController();
  final ingredientsController = TextEditingController();
  final instructionsController = TextEditingController();

  bool isSaving = false;

  @override
  void dispose() {
    nameController.dispose();
    imageController.dispose();
    cuisineController.dispose();
    prepController.dispose();
    cookController.dispose();
    servingsController.dispose();
    ingredientsController.dispose();
    instructionsController.dispose();
    super.dispose();
  }

  Widget buildField(
      String label,
      TextEditingController controller, {
        int maxLines = 1,
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }

          if (keyboardType == TextInputType.number) {
            final number = int.tryParse(value.trim());

            if (number == null || number < 1) {
              return 'Enter a valid number greater than 0';
            }
          }

          return null;
        },
      ),
    );
  }

  Future<void> saveRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isSaving = true;
    });

    try {
      final recipe = Recipe(
        id: DateTime.now().millisecondsSinceEpoch,
        name: nameController.text.trim(),
        image: imageController.text.trim(),
        cuisine: cuisineController.text.trim(),
        prepTimeMinutes: int.parse(prepController.text.trim()),
        cookTimeMinutes: int.parse(cookController.text.trim()),
        servings: int.parse(servingsController.text.trim()),
        ingredients: ingredientsController.text
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
        instructions: instructionsController.text
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
      );

      await context.read<RecipeProvider>().addRecipe(recipe);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recipe added successfully!'),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding recipe: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Recipe'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildField('Recipe Name', nameController),
              buildField('Image URL', imageController),
              buildField('Cuisine', cuisineController),
              buildField(
                'Preparation Time (minutes)',
                prepController,
                keyboardType: TextInputType.number,
              ),
              buildField(
                'Cooking Time (minutes)',
                cookController,
                keyboardType: TextInputType.number,
              ),
              buildField(
                'Servings',
                servingsController,
                keyboardType: TextInputType.number,
              ),
              buildField(
                'Ingredients (one per line)',
                ingredientsController,
                maxLines: 5,
              ),
              buildField(
                'Instructions (one per line)',
                instructionsController,
                maxLines: 6,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isSaving ? null : saveRecipe,
                  child: isSaving
                      ? const CircularProgressIndicator()
                      : const Text('Save Recipe'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}