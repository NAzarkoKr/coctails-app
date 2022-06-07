class CocktailModel {
  final String name;
  final String category;
  final String alcoholic;
  final String glassType;
  final String pictureUrl;
  final String instructions;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String ingredient5;
  final String ingredient6;
  final String ingredient7;
  final String ingredient8;
  final String ingredient9;
  final String ingredient10;

  CocktailModel({
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glassType,
    required this.pictureUrl,
    required this.instructions,
    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
    required this.ingredient4,
    required this.ingredient5,
    required this.ingredient6,
    required this.ingredient7,
    required this.ingredient8,
    required this.ingredient9,
    required this.ingredient10,
  });

  factory CocktailModel.fromJson(Map<String, dynamic> json) {
    return CocktailModel(
      name: json['strDrink'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glassType: json['strGlass'],
      pictureUrl: json['strDrinkThumb'],
      instructions: json['strInstructions'],
      ingredient1: json['strIngredient1'] ?? '',
      ingredient2: json['strIngredient2'] ?? '',
      ingredient3: json['strIngredient3'] ?? '',
      ingredient4: json['strIngredient4'] ?? '',
      ingredient5: json['strIngredient5'] ?? '',
      ingredient6: json['strIngredient6'] ?? '',
      ingredient7: json['strIngredient7'] ?? '',
      ingredient8: json['strIngredient8'] ?? '',
      ingredient9: json['strIngredient9'] ?? '',
      ingredient10: json['strIngredient10'] ?? '',
    );
  }
}
