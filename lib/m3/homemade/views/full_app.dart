import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/full_app_controller.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class FullApp extends StatefulWidget {
  const FullApp({Key? key}) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late FullAppController appController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
    appController =
        FxControllerStore.putOrFind(FullAppController(this), save: false);
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder(
        controller: appController,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Stack(
                children: [
                  TabBarView(
                    controller: appController.tabController,
                    children: <Widget>[
                      HomeScreen(),
                      SearchScreen(),
                      ChatScreen(),
                      ProfileScreen()
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: FxSpacing.xy(12, 8),
                      child: PhysicalModel(
                        color: theme.cardTheme.color!.withAlpha(200),
                        elevation: 12,
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        shadowColor:
                            theme.colorScheme.onBackground.withAlpha(12),
                        shape: BoxShape.rectangle,
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.cardTheme.color!.withAlpha(200),
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          padding: FxSpacing.xy(16, 12),
                          child: Row(
                            children: <Widget>[
                              singleItem(
                                  index: 0,
                                  iconData: FeatherIcons.home,
                                  activeIconData: FeatherIcons.home,
                                  title: "Home"),
                              singleItem(
                                  index: 1,
                                  iconData: FeatherIcons.search,
                                  activeIconData: FeatherIcons.search,
                                  title: "Search"),
                              singleItem(
                                  index: 2,
                                  activeIconData: FeatherIcons.messageCircle,
                                  iconData: FeatherIcons.messageCircle,
                                  title: "Chat"),
                              singleItem(
                                  index: 3,
                                  iconData: FeatherIcons.user,
                                  activeIconData: FeatherIcons.user,
                                  title: "Profile"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget singleItem(
      {required int index,
      required IconData iconData,
      required IconData activeIconData,
      required String title}) {
    double width = MediaQuery.of(context).size.width - 64;
    double selectedWidth = width * (1.5 / 4.5);
    double unSelectedWidth = width * (1 / 4.5);

    bool selected = index == appController.currentIndex;

    if (selected) {
      return Container(
        width: selectedWidth,
        padding: FxSpacing.y(8),
        decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              activeIconData,
              size: 20,
              color: theme.colorScheme.onPrimary,
            ),
            FxSpacing.width(8),
            FxText.bodyMedium(title,
                color: theme.colorScheme.onPrimary,
                letterSpacing: 0.3,
                fontWeight: 600),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          appController.onTapped(index);
        },
        child: Container(
          width: unSelectedWidth,
          child: Center(
              child: Icon(
            iconData,
            size: 20,
            color: theme.colorScheme.onBackground,
          )),
        ),
      );
    }
  }
}
