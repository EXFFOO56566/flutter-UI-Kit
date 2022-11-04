import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/meal_plan_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';
import '../models/date_time.dart';
import '../models/meal_plan.dart';
import 'package:flutter/material.dart';

import 'recipe_screen.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  late ThemeData theme;
  late MealPlanController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(MealPlanController());
    theme = AppTheme.cookifyTheme;
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < controller.listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = controller.listDateTime[index];
    bool active = controller.selectedDate == index;

    return FxContainer.none(
      onTap: () {
        setState(() {
          controller.selectedDate = index;
        });
      },
      splashColor: theme.colorScheme.primaryContainer,
      width: 40,
      margin: FxSpacing.x(2),
      padding: FxSpacing.y(8),
      borderRadiusAll: 4,
      color: active ? theme.colorScheme.primary : Colors.transparent,
      child: Column(
        children: [
          FxText.bodySmall(dateTime.date,
              color: active
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
          FxSpacing.height(8),
          FxText.bodySmall(dateTime.day,
              color: active
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in controller.listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: FxContainer.none(
        splashColor: theme.colorScheme.primaryContainer,
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
        },
        color: Colors.transparent,
        margin: FxSpacing.bottom(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.bodyMedium(mealPlan.type, muted: true, letterSpacing: 0),
            FxSpacing.height(8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(mealPlan.image),
                    height: 56,
                    width: 56,
                  ),
                ),
                FxSpacing.width(8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyMedium(mealPlan.title,
                        fontWeight: 700, letterSpacing: 0),
                    FxSpacing.height(8),
                    FxText.bodySmall(mealPlan.time,
                        muted: true, letterSpacing: 0),
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onBackground,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<MealPlanController>(
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
        body: ListView(
            padding: FxSpacing.fromLTRB(
                20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
            children: [
              FxText.displaySmall("Today\'s Plan",
                  fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildDateTime(),
                ),
              ),
              FxSpacing.height(24),
              FxContainer(
                color: theme.colorScheme.primaryContainer,
                child: Column(
                  children: [
                    Center(
                        child: FxText.titleLarge(
                      "Vitamins & Minerals",
                      color: theme.colorScheme.primary,
                      fontWeight: 600,
                    )),
                    FxSpacing.height(4),
                    Center(
                        child: FxText.bodySmall(
                      "How Much Should You Take?",
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                      letterSpacing: 0,
                    )),
                    FxSpacing.height(16),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              FxText.displayLarge(
                                "80",
                                fontWeight: 800,
                                color: theme.colorScheme.primary,
                              ),
                              FxText.bodySmall(
                                "Vitamin A",
                                xMuted: true,
                                letterSpacing: 0,
                                fontSize: 10,
                              )
                            ],
                          )),
                          VerticalDivider(
                            thickness: 1,
                            color: theme.colorScheme.primary.withAlpha(200),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              FxText.displayLarge(
                                "16",
                                fontWeight: 800,
                                color: theme.colorScheme.primary,
                              ),
                              FxText.bodySmall(
                                "Vitamin B",
                                fontSize: 10,
                                xMuted: true,
                                letterSpacing: 0,
                              )
                            ],
                          )),
                          VerticalDivider(
                            thickness: 1,
                            color: theme.colorScheme.primary.withAlpha(200),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                FxText.displayLarge(
                                  "97",
                                  fontWeight: 800,
                                  color: theme.colorScheme.primary,
                                ),
                                FxText.bodySmall(
                                  "Water",
                                  xMuted: true,
                                  letterSpacing: 0,
                                  fontSize: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(24),
              Column(
                children: buildMealPlan(),
              ),
            ]),
      );
    }
  }
}
