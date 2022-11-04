import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/full_app_controller.dart';
import '../views/cart_screen.dart';
import '../views/home_screen.dart';
import '../views/profile_screen.dart';
import '../views/search_screen.dart';

class FullApp extends StatefulWidget {
  const FullApp({Key? key}) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> with SingleTickerProviderStateMixin {
  late ThemeData theme;

  late FullAppController controller;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.putOrFind(FullAppController(this));
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Container(
        child: Icon(
          controller.navItems[i].iconData,
          size: 20,
          color: (controller.currentIndex == i)
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground,
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FullAppController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: <Widget>[
                      HomeScreen(),
                      SearchScreen(),
                      CartScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                FxContainer(
                  bordered: true,
                  enableBorderRadius: false,
                  border: Border(
                      top: BorderSide(
                          color: theme.dividerColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  padding: FxSpacing.xy(12, 16),
                  color: theme.scaffoldBackgroundColor,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: FxTabIndicator(
                        indicatorColor: theme.colorScheme.primary,
                        indicatorHeight: 3,
                        radius: 3,
                        indicatorStyle: FxTabIndicatorStyle.rectangle,
                        yOffset: -18),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: theme.colorScheme.primary,
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
