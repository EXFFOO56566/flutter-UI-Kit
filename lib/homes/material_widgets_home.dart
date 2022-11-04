/*
* File : Material Widget Home Page
* Version : 1.0.0
* */
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/widgets/material/advanced/advanced_screen.dart';
import 'package:flutkit/widgets/material/appbar/app_bar_widget.dart';
import 'package:flutkit/widgets/material/appbar/search_bar_widget.dart';
import 'package:flutkit/widgets/material/appbar/sliver_app_bar_widget.dart';
import 'package:flutkit/widgets/material/basic/basic_screen.dart';
import 'package:flutkit/widgets/material/bottomsheet/bottom_sheets_screen.dart';
import 'package:flutkit/widgets/material/button/buttons_screen.dart';
import 'package:flutkit/widgets/material/card/cards_screen.dart';
import 'package:flutkit/widgets/material/carousel/carousels_screen.dart';
import 'package:flutkit/widgets/material/dialog/dialogs_screen.dart';
import 'package:flutkit/widgets/material/expansion/expansions_screen.dart';
import 'package:flutkit/widgets/material/input/inputs_screen.dart';
import 'package:flutkit/widgets/material/list/lists_screen.dart';
import 'package:flutkit/widgets/material/navigation/bottom_navigation_widget.dart';
import 'package:flutkit/widgets/material/navigation/custom_bottom_navigation_widget.dart';
import 'package:flutkit/widgets/material/navigation/flutx_bottom_navigation_screen.dart';
import 'package:flutkit/widgets/material/navigation/navigation_drawer.dart';
import 'package:flutkit/widgets/material/navigation/navigation_rail_widget.dart';
import 'package:flutkit/widgets/material/navigation/top_navigation_widget.dart';
import 'package:flutkit/widgets/material/navigation/top_scrollable_navigation_widget.dart';
import 'package:flutkit/widgets/material/progress/progresses_screen.dart';
import 'package:provider/provider.dart';

import 'single_grid_item.dart';

class MaterialWidgetsHome extends StatefulWidget {
  @override
  _MaterialWidgetsHomeState createState() => _MaterialWidgetsHomeState();
}

class _MaterialWidgetsHomeState extends State<MaterialWidgetsHome> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = AppTheme.theme;
      return Container(
        child: ListView(
          padding: FxSpacing.x(20),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            FxText.titleSmall(
              "BASIC",
              fontWeight: 700,
              muted: true,
            ),
            FxSpacing.height(20),
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: FxSpacing.zero,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20.0,
                children: <Widget>[
                  SinglePageItem(
                    title: "Basic",
                    icon: Images.basicIcon,
                    navigation: BasicScreen(),
                  ),
                  SingleGridItem(
                    title: "App Bar",
                    icon: Images.topAppBarIcon,
                    items: <SinglePageItem>[
                      SinglePageItem(
                        title: "App Bars",
                        icon: Images.topAppBarIcon,
                        navigation: AppBarWidget(),
                      ),
                      SinglePageItem(
                        title: "Search Bars",
                        icon: Images.topAppBarIcon,
                        navigation: SearchBarWidget(),
                      ),
                      SinglePageItem(
                        title: "Sliver Appbar",
                        icon: Images.topAppBarIcon,
                        navigation: SliverAppBarWidget(),
                      ),
                    ],
                  ),
                  SinglePageItem(
                    title: "Bottom Sheet",
                    icon: Images.bottomSheetIcon,
                    navigation: BottomSheetsScreen(),
                  ),
                  SinglePageItem(
                    title: "Buttons",
                    icon: Images.buttonIcon,
                    navigation: ButtonsScreen(),
                  ),
                  SinglePageItem(
                    title: "Card",
                    icon: Images.cardIcon,
                    navigation: CardsScreen(),
                  ),
                  SinglePageItem(
                    title: "Dialogs",
                    icon: Images.dialogIcon,
                    navigation: DialogsScreen(),
                  ),
                  SinglePageItem(
                    title: "List",
                    icon: Images.listBulletsIcon,
                    navigation: ListsScreen(),
                  ),
                  SingleGridItem(
                    title: "Navigation",
                    icon: Images.navigationIcon,
                    items: <SinglePageItem>[
                      SinglePageItem(
                        title: "FX Navigation",
                        icon: Images.navigationIcon,
                        navigation: FxBottomNavigationScreen(),
                      ),
                      SinglePageItem(
                        title: "Top",
                        icon: Images.navigationIcon,
                        navigation: TopNavigationWidget(),
                      ),
                      SinglePageItem(
                        icon: Images.navigationIcon,
                        title: "Scrollable",
                        navigation: TopScrollableNavigationWidget(),
                      ),
                      SinglePageItem(
                        icon: Images.navigationIcon,
                        title: "Rail",
                        navigation: NavigationRailWidget(),
                      ),
                      SinglePageItem(
                        icon: Images.navigationIcon,
                        title: "Bottom",
                        navigation: BottomNavigationWidget(),
                      ),
                      SinglePageItem(
                        icon: Images.navigationIcon,
                        title: "Drawer",
                        navigation: NavigationDrawerWidget(),
                      ),
                      SinglePageItem(
                        icon: Images.navigationIcon,
                        title: "Custom Bottom",
                        navigation: CustomBottomNavigationWidget(),
                      ),
                    ],
                  ),
                ]),
            FxSpacing.height(20),
            FxText.titleSmall(
              "ADVANCED",
              fontWeight: 700,
              muted: true,
            ),
            FxSpacing.height(20),
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: FxSpacing.zero,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20.0,
                children: <Widget>[
                  SinglePageItem(
                    title: "Advanced",
                    icon: Images.advancedIcon,
                    navigation: AdvancedScreen(),
                  ),
                  SinglePageItem(
                    title: "Carousel",
                    icon: Images.carouselIcon,
                    navigation: CarouselsScreen(),
                  ),
                  SinglePageItem(
                    title: "Expansions",
                    icon: Images.expansionIcon,
                    navigation: ExpansionsScreen(),
                  ),
                  SinglePageItem(
                    title: "Forms",
                    icon: Images.formIcon,
                    navigation: InputsScreen(),
                  ),
                  SinglePageItem(
                    title: "Progress",
                    icon: Images.progressIcon,
                    navigation: ProgressesScreen(),
                  ),
                ]),
            FxContainer(
              margin: FxSpacing.y(20),
              borderRadiusAll: 4,
              color: theme.colorScheme.primary.withAlpha(24),
              child: Center(
                child: FxText.bodyMedium("More widgets are coming very soon...",
                    fontWeight: 600, color: theme.colorScheme.primary),
              ),
            ),
          ],
        ),
      );
    });
  }
}
