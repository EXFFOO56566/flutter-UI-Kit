class FullRecipe {
  final String title, body, image;
  final List<Nutrition> nutritions;
  final List<Ingredient> ingredients;
  final String preparation;

  FullRecipe(this.title, this.body, this.image, this.nutritions,
      this.ingredients, this.preparation);

  static FullRecipe getSingle() {
    return FullRecipe(
        "Watercress salad",
        "White Onion, Fennel, and watercress Salad",
        "./assets/images/apps/cookify/meal-1.jpg",
        Nutrition.getList(),
        Ingredient.getList(),
        "Place the asparagus into a mixing bowl, and drizzle with the olive oil. Toss to coat the spears, then sprinkle with Parmesan cheese, garlic, salt, and pepper. Arrange the asparagus onto a baking sheet in a single layer. \n\nBake in the preheated oven until just tender, 12 to 15 minutes depending on thickness. Sprinkle with lemon juice just before serving.");
  }
}

class Nutrition {
  final String name, unitType;
  final double unit;

  Nutrition(this.name, this.unitType, this.unit);

  static List<Nutrition> getList() {
    return [
      Nutrition("Calories", "Kcal", 250),
      Nutrition("Carbo", "g", 35),
      Nutrition("Protein", "g", 6.8),
    ];
  }
}

class Ingredient {
  final String ingredient;

  Ingredient(this.ingredient);

  static List<Ingredient> getList() {
    return [
      Ingredient("2 cups pecans, divided"),
      Ingredient("1 tablespoon unsalted butter, melted"),
      Ingredient("1½ tablespoons grated Parmesan cheese (Optional)"),
      Ingredient("1 teaspoon sea salt"),
      Ingredient("½ teaspoon ground black pepper"),
      Ingredient("1 tablespoon lemon juice (Optional)"),
    ];
  }
}
