import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/showcase_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'recipe_screen.dart';
import '../models/category.dart';
import '../models/showcase.dart';

class ShowcaseScreen extends StatefulWidget {
  @override
  _ShowcaseScreenState createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  late ThemeData theme;
  late ShowcaseController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ShowcaseController());
    theme = AppTheme.cookifyTheme;
  }

  List<Widget> buildShowcases() {
    List<Widget> list = [];

    for (Showcase showcase in controller.showcases) {
      list.add(singleShowcase(showcase));
    }

    return list;
  }

  Widget singleShowcase(Showcase showcase) {
    return FxContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
      },
      color: Colors.transparent,
      padding: FxSpacing.bottom(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(showcase.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.bodyLarge(showcase.title, fontWeight: 700, letterSpacing: 0),
          FxText.bodySmall(showcase.body,
              muted: true, fontWeight: 500, letterSpacing: -0.1),
          FxSpacing.height(16),
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: 16,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
              FxSpacing.width(4),
              FxText.bodySmall(showcase.likes.toString(), muted: true),
              FxSpacing.width(16),
              Icon(
                Icons.schedule,
                size: 16,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
              FxSpacing.width(4),
              FxText.bodySmall(showcase.timeInMinutes.toString() + "'",
                  muted: true),
              FxSpacing.width(24),
              FxText.bodySmall(showcase.ingredients.toString() + " Ingredients",
                  muted: true)
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Category category in controller.categories) {
      list.add(singleCategory(category));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget singleCategory(Category category) {
    return FxContainer(
      paddingAll: 16,
      color: theme.colorScheme.primaryContainer,
      child: Column(
        children: [
          FxTwoToneIcon(
            category.icon,
            color: theme.colorScheme.primary,
            size: 28,
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            category.title,
            color: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ShowcaseController>(
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
                  padding: FxSpacing.x(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: FxTextField(
                          prefixIcon: Icon(Icons.search,
                              color: theme.colorScheme.onBackground
                                  .withAlpha(160)),
                          filled: true,
                          labelTextColor: AppTheme
                              .theme.colorScheme.onBackground
                              .withAlpha(200),
                          labelText: "Search",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          cursorColor: theme.colorScheme.primary,
                          focusedBorderColor: Colors.transparent,
                          fillColor:
                              theme.colorScheme.onBackground.withAlpha(10),
                        ),
                      ),
                      FxSpacing.width(16),
                      FxContainer(
                        padding: FxSpacing.all(12),
                        color: theme.colorScheme.primary.withAlpha(80),
                        child: Icon(
                          Icons.local_dining_outlined,
                          size: 24,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: buildCategories(),
                  ),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    children: buildShowcases(),
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary),
                          strokeWidth: 2)),
                ),
                FxSpacing.height(24)
              ],
            ),
          ),
        ),
      );
    }
  }
}
