import 'ingredient.dart';
import 'nutrition.dart';

class FullRecipe {
  final String title, body, image;
  final List<Nutrition> nutritions;
  final List<Ingredient> ingredients;
  final String preparation;

  FullRecipe(this.title, this.body, this.image, this.nutritions,
      this.ingredients, this.preparation);

  static Future<FullRecipe> getSingle() async {
    return FullRecipe(
        "Watercress salad",
        "White Onion, Fennel, and watercress Salad",
        "./assets/images/apps/cookify/meal-1.jpg",
        await Nutrition.getDummyList(),
        await Ingredient.getDummyList(),
        "Place the asparagus into a mixing bowl, and drizzle with the olive oil. Toss to coat the spears, then sprinkle with Parmesan cheese, garlic, salt, and pepper. Arrange the asparagus onto a baking sheet in a single layer. \n\nBake in the preheated oven until just tender, 12 to 15 minutes depending on thickness. Sprinkle with lemon juice just before serving.");
  }
}
