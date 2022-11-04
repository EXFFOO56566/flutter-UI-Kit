import 'package:flutkit/m3/cookify/models/recipe.dart';
import 'package:flutkit/m3/cookify/views/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;
  late Recipe recipe;
  late List<Recipe> trendingRecipe;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    recipe = await Recipe.getOne();
    trendingRecipe = await Recipe.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToRecipeScreen() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
