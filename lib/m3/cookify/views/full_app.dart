import 'package:flutkit/m3/cookify/controllers/full_app_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutx/flutx.dart';
import 'home_screen.dart';
import 'meal_plan_screen.dart';
import 'profile_screen.dart';
import 'showcase_screen.dart';
import 'package:flutter/material.dart';

class FullApp extends StatefulWidget {
  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  late FullAppController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(FullAppController());
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      child: Scaffold(
        body: FxBottomNavigationBar(
          activeTitleStyle: FxTextStyle.bodySmall(
              color: theme.colorScheme.primary, fontWeight: 800),
          activeContainerColor: theme.colorScheme.primary.withAlpha(120),
          containerShape: BoxShape.rectangle,
          fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
          containerRadius: Constant.containerRadius.small,
          backgroundColor: theme.colorScheme.primaryContainer,
          showLabel: false,
          labelSpacing: 8,
          initialIndex: 0,
          labelDirection: Axis.horizontal,
          itemList: [
            FxBottomNavigationBarItem(
              page: HomeScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.home,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.cottage,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              title: "Home",
              activeIconColor: theme.colorScheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: ShowcaseScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.import_contacts,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              title: "Explore",
              activeIconColor: theme.colorScheme.primary,
              activeTitleColor: theme.colorScheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: MealPlanScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.fastfood,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.lunch_dining,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              title: "Meal",
              activeIconColor: theme.colorScheme.primary,
              activeTitleColor: theme.colorScheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: ProfileScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.person,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              title: "Setting",
              activeIconColor: theme.colorScheme.primary,
              activeTitleColor: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
