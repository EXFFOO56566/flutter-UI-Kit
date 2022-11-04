import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/full_app_controller.dart';
import 'chat_screen.dart';
import 'explore_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

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
    theme = AppTheme.learningTheme;
    controller = FxControllerStore.putOrFind(FullAppController(this));
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FxContainer(
              padding: FxSpacing.xy(16, 4),
              color: controller.currentIndex == i
                  ? theme.colorScheme.primary.withAlpha(80)
                  : Colors.transparent,
              borderRadiusAll: 24,
              child: Icon(
                controller.currentIndex == i
                    ? controller.navItems[i].activeIconData
                    : controller.navItems[i].inactiveIconData,
                size: 20,
                color: theme.colorScheme.onBackground,
              ),
            ),
            FxSpacing.height(4),
            FxText.bodySmall(controller.navItems[i].title,
                letterSpacing: 0,
                fontWeight: controller.currentIndex == i ? 700 : 500),
          ],
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FullAppController>(
        controller: controller,
        builder: (shoppingFullAppController) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: FxContainer(
                color: Colors.transparent,
                margin: FxSpacing.left(4),
                onTap: () {
                  controller.goToSetting();
                },
                child: Icon(
                  FeatherIcons.settings,
                  size: 20,
                ),
              ),
              title: FxText.titleMedium(
                controller.navItems[controller.currentIndex].title
                    .toUpperCase(),
                fontWeight: 700,
              ),
              actions: [
                InkWell(
                  onTap: () {
                    controller.goToTimeTable();
                  },
                  child: Container(
                    margin: FxSpacing.x(20),
                    child: Icon(
                      FeatherIcons.calendar,
                      size: 20,
                    ),
                  ),
                )
              ],
              centerTitle: true,
            ),
            body: Column(
              children: [
                FxSpacing.height(4),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: <Widget>[
                      HomeScreen(),
                      ExploreScreen(),
                      ChatScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                FxContainer(
                  borderRadiusAll: 0,
                  color: theme.colorScheme.primaryContainer.withAlpha(100),
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: FxTabIndicator(
                      indicatorColor: Colors.transparent,
                      radius: 0,
                    ),
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
