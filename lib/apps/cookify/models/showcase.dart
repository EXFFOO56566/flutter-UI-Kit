class Showcase {
  final String image, title, body;
  final int likes, timeInMinutes, ingredients;

  Showcase(this.image, this.title, this.body, this.likes, this.timeInMinutes,
      this.ingredients);

  static List<Showcase> getList() {
    return [
      Showcase(
          "./assets/images/apps/cookify/dish-2.jpg",
          "Cacoa Maca Walnut Milk",
          "Easy, quick and yet so delicious!",
          100,
          50,
          2),
      Showcase("./assets/images/apps/cookify/dish-3.jpg", "Danish Pecun",
          "Typical winter pastries", 189, 30, 1),
      Showcase("./assets/images/apps/cookify/dish-4.jpg", "Maple Syrup Buns",
          "Easy, quick and yet so delicious!", 100, 1, 3),
    ];
  }
}
