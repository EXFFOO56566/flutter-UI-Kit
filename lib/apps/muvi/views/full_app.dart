import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/full_app_controller.dart';
import '../views/download_screen.dart';
import '../views/explore_screen.dart';
import '../views/home_screen.dart';
import '../views/profile_screen.dart';

class FullApp extends StatefulWidget {
  const FullApp({Key? key}) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  late FullAppController controller;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(FullAppController(this));
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Icon(
        controller.navItems[i].iconData,
        size: 22,
        color: (controller.currentIndex == i)
            ? customTheme.muviPrimary
            : theme.colorScheme.onBackground,
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
                    physics: ClampingScrollPhysics(),
                    controller: controller.tabController,
                    children: <Widget>[
                      HomeScreen(),
                      ExploreScreen(),
                      DownloadScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                FxContainer.none(
                  padding: FxSpacing.xy(12, 16),
                  color: theme.scaffoldBackgroundColor,
                  bordered: true,
                  enableBorderRadius: false,
                  borderRadiusAll: 0,
                  border: Border(
                    top: BorderSide(width: 2, color: customTheme.border),
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: FxTabIndicator(
                        indicatorColor: customTheme.muviPrimary,
                        indicatorStyle: FxTabIndicatorStyle.rectangle,
                        indicatorHeight: 2,
                        radius: 4,
                        yOffset: -18,
                        width: 24),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: customTheme.muviPrimary,
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
