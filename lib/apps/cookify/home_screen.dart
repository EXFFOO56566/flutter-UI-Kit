import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'recipe_screen.dart';
import 'models/recipe.dart';

class CookifyHomeScreen extends StatefulWidget {
  @override
  _CookifyHomeScreenState createState() => _CookifyHomeScreenState();
}

class _CookifyHomeScreenState extends State<CookifyHomeScreen> {
  late Recipe recipe;
  late List<Recipe> trendingRecipe;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    recipe = Recipe.getOne();
    trendingRecipe = Recipe.getList();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: FxSpacing.top(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: FxSpacing.x(16),
                    child: FxText.headlineLarge("Hello Den,",
                        color: customTheme.cookifyPrimary, fontWeight: 800),
                  ),
                  Container(
                    margin: FxSpacing.x(16),
                    child: FxText.bodyMedium(
                        "Excited to cook something new today?",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        xMuted: true,
                        fontWeight: 700),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                      margin: FxSpacing.x(16),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => CookifyRecipeScreen()));
                      },
                      splashColor: customTheme.cookifyPrimary.withAlpha(40),
                      color: customTheme.cookifyPrimary.withAlpha(30),
                      child: Row(
                        children: [
                          FxTwoToneIcon(
                            FxTwoToneMdiIcons.outdoor_grill,
                            color: customTheme.cookifyPrimary,
                            size: 48,
                          ),
                          FxSpacing.width(16),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodySmall(
                                  "You have 12 recipes that\nyou haven\'t tried yet",
                                  fontWeight: 700),
                              FxButton.text(
                                  padding: FxSpacing.zero,
                                  onPressed: () {},
                                  splashColor:
                                      customTheme.cookifyPrimary.withAlpha(40),
                                  child: FxText.labelMedium("See Recipes",
                                      color: customTheme.cookifyPrimary,
                                      decoration: TextDecoration.underline))
                            ],
                          ))
                        ],
                      )),
                  FxSpacing.height(16),
                  Container(
                    margin: FxSpacing.x(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => CookifyRecipeScreen()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(recipe.image),
                            ),
                            Positioned(
                                left: 16,
                                top: 16,
                                child: FxContainer(
                                  paddingAll: 8,
                                  color:
                                      customTheme.cookifyPrimary.withAlpha(200),
                                  child: FxText.bodySmall(recipe.tag,
                                      color: customTheme.cookifyOnPrimary,
                                      fontWeight: 600),
                                )),
                            Positioned(
                                right: 16,
                                top: 16,
                                child: Icon(
                                  recipe.favorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  color: customTheme.cookifyPrimary,
                                  size: 28,
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: FxSpacing.fromLTRB(16, 48, 16, 32),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        customTheme.cookifyPrimary
                                            .withAlpha(220),
                                        customTheme.cookifyPrimary
                                            .withAlpha(180),
                                        customTheme.cookifyPrimary
                                            .withAlpha(140),
                                        customTheme.cookifyPrimary
                                            .withAlpha(100),
                                        Colors.transparent
                                      ],
                                          stops: [
                                        0.1,
                                        0.25,
                                        0.5,
                                        0.7,
                                        1
                                      ])),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.headlineLarge(recipe.title,
                                          color: Colors.white, fontWeight: 800),
                                      FxSpacing.height(16),
                                      FxText.bodySmall(
                                          recipe.preparationTime.toString() +
                                              " Recipes | " +
                                              recipe.serving.toString() +
                                              " Serving",
                                          color: Colors.white,
                                          fontWeight: 600),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  FxSpacing.height(16),
                  Container(
                      margin: FxSpacing.x(16),
                      child: FxText.titleMedium(
                        "Trending Recipe",
                        fontWeight: 800,
                      )),
                  FxSpacing.height(16),
                  SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: recipeList(),
                    ),
                  ),
                  FxSpacing.height(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> recipeList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(16));

    for (int i = 0; i < trendingRecipe.length; i++) {
      list.add(singleRecipe(trendingRecipe[i]));
      list.add(FxSpacing.width(16));
    }

    return list;
  }

  Widget singleRecipe(Recipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Image(
              image: AssetImage(recipe.image),
              width: 240,
            ),
            Positioned(
                left: 16,
                top: 16,
                child: FxContainer(
                  paddingAll: 8,
                  color: Colors.black.withAlpha(200),
                  child: FxText.bodySmall(recipe.tag,
                      color: customTheme.cookifyOnPrimary, fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: FxContainer(
                  padding: FxSpacing.xy(12, 16),
                  color:
                      Color.lerp(customTheme.cookifyPrimary, Colors.black, 0.9)!
                          .withAlpha(160),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FxText.titleMedium(recipe.title,
                                color: Colors.white, fontWeight: 800),
                          ),
                          Icon(
                            recipe.favorite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: customTheme.cookifyPrimary,
                            size: 18,
                          )
                        ],
                      ),
                      FxSpacing.height(16),
                      FxText.bodySmall(
                          recipe.preparationTime.toString() +
                              " Recipes | " +
                              recipe.serving.toString() +
                              " Serving",
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: 600),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
