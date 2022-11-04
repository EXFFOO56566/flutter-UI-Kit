import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/recipe_controller.dart';
import 'package:flutkit/m3/cookify/models/ingredient.dart';
import 'package:flutkit/m3/cookify/models/nutrition.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late ThemeData theme;
  late RecipeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(RecipeController());
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < controller.recipe.nutritions.length; i++) {
      list.add(singleNutrition(controller.recipe.nutritions[i]));
      if (i + 1 < controller.recipe.nutritions.length)
        list.add(FxSpacing.height(16));
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return FxContainer(
      borderRadiusAll: 50,
      padding: FxSpacing.fromLTRB(8, 8, 12, 8),
      color: theme.colorScheme.primaryContainer,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FxContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: theme.colorScheme.primary.withAlpha(200),
              border: Border.all(color: theme.colorScheme.primary, width: 1),
              child: Center(
                  child: FxText.bodySmall(
                      FxTextUtils.doubleToString(
                        nutrition.unit,
                      ),
                      letterSpacing: 0,
                      color: theme.colorScheme.onPrimary))),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.bodySmall(nutrition.name, fontWeight: 600),
              FxText.bodySmall(nutrition.unitType,
                  fontSize: 10, xMuted: true, fontWeight: 600),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildIngredientList() {
    List<Widget> list = [];
    for (Ingredient ingredient in controller.recipe.ingredients) {
      list.add(FxText.bodySmall(ingredient.ingredient,
          muted: true, height: 1.7, letterSpacing: 0));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      child: FxBuilder<RecipeController>(
          controller: controller,
          builder: (controller) {
            return _buildBody();
          }),
    );
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: theme.colorScheme.onBackground,
            ),
          ),
          actions: [
            Icon(
              Icons.favorite_border,
              color: theme.colorScheme.primary,
            ),
            FxSpacing.width(16)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: theme.colorScheme.primary,
          label: FxText.bodyMedium("Watch Video",
              color: theme.colorScheme.onPrimary, fontWeight: 600),
          icon: Icon(
            Icons.play_circle_fill,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.scaffoldBackgroundColor,
          child: ListView(
            padding: FxSpacing.fromLTRB(24, 4, 24, 0),
            children: [
              FxText.displaySmall(controller.recipe.title,
                  fontWeight: 800, letterSpacing: -0.2),
              FxSpacing.height(8),
              FxText.bodyMedium(controller.recipe.body,
                  color: theme.colorScheme.onBackground.withAlpha(140),
                  letterSpacing: 0,
                  fontWeight: 600),
              FxSpacing.height(24),
              Row(
                children: [
                  Column(
                    children: [
                      FxText.titleLarge("Nutritions",
                          fontWeight: 700, letterSpacing: -0.2),
                      FxSpacing.height(16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildNutritionList()),
                    ],
                  ),
                  FxSpacing.width(24),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image(
                        image: AssetImage(controller.recipe.image),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              FxSpacing.height(24),
              FxText.titleLarge("Ingredients",
                  fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildIngredientList(),
              ),
              FxSpacing.height(24),
              FxText.titleLarge("Preparation",
                  fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(16),
              FxText.bodyMedium(controller.recipe.preparation,
                  fontWeight: 500, letterSpacing: 0, muted: true),
              FxSpacing.height(80)
            ],
          ),
        ),
      );
    }
  }
}
