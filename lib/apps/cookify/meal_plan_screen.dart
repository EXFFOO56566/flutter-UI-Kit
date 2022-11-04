import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';
import 'models/date_time.dart';
import 'models/meal_plan.dart';
import 'package:flutter/material.dart';

import 'recipe_screen.dart';

class CookifyMealPlanScreen extends StatefulWidget {
  @override
  _CookifyMealPlanScreenState createState() => _CookifyMealPlanScreenState();
}

class _CookifyMealPlanScreenState extends State<CookifyMealPlanScreen> {
  int _selectedDate = 0;
  late List<DateTime> _listDateTime;
  late List<MealPlan> _listMealPlan;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    _listDateTime = DateTime.getList();
    _listMealPlan = MealPlan.getList();
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
          body: ListView(padding: FxSpacing.all(24), children: [
            FxText.headlineSmall("Today\'s Plan",
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
              color: customTheme.cookifyPrimary.withAlpha(40),
              child: Column(
                children: [
                  Center(
                      child: FxText.titleLarge(
                    "Vitamins & Minerals",
                    color: customTheme.cookifyPrimary,
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
                            FxText.headlineLarge(
                              "80",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
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
                          color: customTheme.cookifyPrimary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            FxText.headlineLarge(
                              "16",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
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
                          color: customTheme.cookifyPrimary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            FxText.headlineLarge(
                              "97",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
                            ),
                            FxText.bodySmall(
                              "Water",
                              xMuted: true,
                              letterSpacing: 0,
                              fontSize: 10,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(24),
            Column(
              children: buildMealPlan(),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < _listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = _listDateTime[index];
    bool active = _selectedDate == index;

    return FxContainer.none(
      onTap: () {
        setState(() {
          _selectedDate = index;
        });
      },
      splashColor: customTheme.cookifyPrimary.withAlpha(40),
      width: 40,
      margin: FxSpacing.x(2),
      padding: FxSpacing.y(8),
      borderRadiusAll: 4,
      color: active ? customTheme.cookifyPrimary : Colors.transparent,
      child: Column(
        children: [
          FxText.bodySmall(dateTime.date,
              color: active
                  ? customTheme.cookifyOnPrimary
                  : theme.colorScheme.onBackground),
          FxSpacing.height(8),
          FxText.bodySmall(dateTime.day,
              color: active
                  ? customTheme.cookifyOnPrimary
                  : theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in _listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: FxContainer.none(
        splashColor: customTheme.cookifyPrimary.withAlpha(40),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
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
}
