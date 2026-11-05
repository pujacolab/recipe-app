class Recipe {
  final int id;
  final String name;
  final String image;
  final String cuisine;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.cuisine,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      cuisine: json['cuisine'] ?? '',
      prepTimeMinutes: json['prepTimeMinutes'] ?? 0,
      cookTimeMinutes: json['cookTimeMinutes'] ?? 0,
      servings: json['servings'] ?? 1,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'cuisine': cuisine,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }
}