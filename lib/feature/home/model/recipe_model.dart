class RecipeModel {
  final num id;
  final String name;
  final String image;
  final num prepTimeMinutes;
  final num cookTimeMinutes;
  final num servings;
  final String difficulty;
  final String cuisine;
  final num rating;
  final num reviewCount;
  final num userId;
  final num caloriesPerServing;
  final List<String> ingredients;
  final List<String> instructions;
  final List<String> tags;
  final List<String> mealType;

  RecipeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.userId,
    required this.caloriesPerServing,
    required this.ingredients,
    required this.instructions,
    required this.tags,
    required this.mealType,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      rating: (json['rating']),
      reviewCount: json['reviewCount'],
      userId: json['userId'],
      caloriesPerServing: json['caloriesPerServing'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      tags: List<String>.from(json['tags']),
      mealType: List<String>.from(json['mealType']),
    );
  }
}
