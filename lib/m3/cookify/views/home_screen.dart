import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/home_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'recipe_screen.dart';
import '../models/recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(HomeController());
  }

  List<Widget> recipeList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(16));

    for (int i = 0; i < controller.trendingRecipe.length; i++) {
      list.add(singleRecipe(controller.trendingRecipe[i]));
      list.add(FxSpacing.width(16));
    }

    return list;
  }

  Widget singleRecipe(Recipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
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
                      color: theme.colorScheme.onPrimary, fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: FxContainer(
                  padding: FxSpacing.xy(12, 16),
                  color:
                      Color.lerp(theme.colorScheme.primary, Colors.black, 0.9)!
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
                            recipe.favourite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: theme.colorScheme.primary,
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

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
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
        body: Container(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: FxSpacing.x(16),
                  child: FxText.displaySmall("Hello Den,",
                      color: theme.colorScheme.primary, fontWeight: 800),
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
                      controller.goToRecipeScreen();
                    },
                    splashColor: theme.colorScheme.primary.withAlpha(40),
                    color: theme.colorScheme.primaryContainer,
                    child: Row(
                      children: [
                        FxTwoToneIcon(
                          FxTwoToneMdiIcons.outdoor_grill,
                          color: theme.colorScheme.primary,
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
                                splashColor: theme.colorScheme.primary,
                                child: FxText.labelMedium("See Recipes",
                                    color: theme.colorScheme.primary,
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
                      controller.goToRecipeScreen();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage(controller.recipe.image),
                          ),
                          Positioned(
                              left: 16,
                              top: 16,
                              child: FxContainer(
                                paddingAll: 8,
                                color: theme.colorScheme.primary.withAlpha(200),
                                child: FxText.bodySmall(controller.recipe.tag,
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: 600),
                              )),
                          Positioned(
                              right: 16,
                              top: 16,
                              child: Icon(
                                controller.recipe.favourite
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: theme.colorScheme.primary,
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
                                      theme.colorScheme.primary.withAlpha(220),
                                      theme.colorScheme.primary.withAlpha(180),
                                      theme.colorScheme.primary.withAlpha(140),
                                      theme.colorScheme.primary.withAlpha(100),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FxText.displaySmall(controller.recipe.title,
                                        color: Colors.white, fontWeight: 800),
                                    FxSpacing.height(16),
                                    FxText.bodySmall(
                                        controller.recipe.preparationTime
                                                .toString() +
                                            " Recipes | " +
                                            controller.recipe.serving
                                                .toString() +
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
      );
    }
  }
}
