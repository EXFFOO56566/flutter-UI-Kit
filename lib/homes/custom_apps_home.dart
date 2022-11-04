import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutx/icons/box_icon/box_icon_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../apps/cookify/splash_screen.dart';
import '../apps/dating/views/splash_screen.dart';
import '../apps/estate/views/splash_screen.dart';
import '../apps/grocery/full_app.dart';
import '../full_apps/nft/views/splash_screen.dart' as nft;
import '../m3/learning/views/splash_screen.dart' as learning;
import '../m3/cookify/views/splash_screen.dart' as cookify;
import '../m3/dating/views/splash_screen.dart' as dating;
import '../m3/estate/views/splash_screen.dart' as estate;
import '../m3/homemade/views/splash_screen.dart' as homemade;
import '../apps/medicare/splash_screen.dart';
import '../apps/muvi/views/splash_screen.dart' as muvi;
import '../full_apps/shopping/views/splash_screen.dart' as shopping;

import '../apps/shopping/full_app.dart';
import '../theme/app_notifier.dart';
import '../theme/app_theme.dart';
import 'single_grid_item.dart';

class CustomAppsHome extends StatefulWidget {
  @override
  _CustomAppsHomeState createState() => _CustomAppsHomeState();
}

class _CustomAppsHomeState extends State<CustomAppsHome>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return Container(
            padding: FxSpacing.fromLTRB(20, 0, 20, 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                FxText.titleSmall(
                  "COOL ANIMATION",
                  fontWeight: 700,
                  muted: true,
                ),
                FxSpacing.height(20),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.zero,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SinglePageItem(
                        iconData: MdiIcons.shoppingOutline,
                        navigation: shopping.SplashScreen(),
                        title: "Shopping",
                      ),
                      SinglePageItem(
                        iconData: MdiIcons.currencyBtc,
                        navigation: nft.SplashScreen(),
                        title: "NFT",
                      ),
                    ]),
                FxSpacing.height(20),
                FxText.titleSmall(
                  "FULL APPS",
                  fontWeight: 700,
                  muted: true,
                ),
                FxSpacing.height(20),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.zero,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SinglePageItem(
                        iconData: Icons.cake_outlined,
                        navigation: homemade.SplashScreen(),
                        title: "Homemade",
                      ),
                      SinglePageItem(
                        iconData: Icons.outdoor_grill_outlined,
                        navigation: CookifySplashScreen(),
                        title: "Cookify",
                      ),
                      SinglePageItem(
                        iconData: Icons.health_and_safety_outlined,
                        navigation: MediCareSplashScreen(),
                        title: "Medi Care",
                      ),
                      SinglePageItem(
                        iconData: MdiIcons.shoppingOutline,
                        navigation: ShoppingFullApp(),
                        title: "Shopping",
                      ),
                      SinglePageItem(
                        iconData: Icons.home_work_outlined,
                        navigation: EstateSplashScreen(),
                        title: "Estate",
                      ),
                      SinglePageItem(
                        iconData: MdiIcons.foodAppleOutline,
                        title: "Grocery",
                        navigation: GroceryFullApp(),
                      ),
                      SinglePageItem(
                        iconData: Icons.favorite_outline_rounded,
                        navigation: DatingSplashScreen(),
                        title: "Dating",
                      ),
                      SinglePageItem(
                        iconData: Icons.live_tv,
                        navigation: muvi.SplashScreen(),
                        title: "Muvi",
                      ),
                    ]),
                FxSpacing.height(20),
                FxText.titleSmall(
                  "MATERIAL YOU",
                  fontWeight: 700,
                  muted: true,
                ),
                FxSpacing.height(20),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.zero,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SinglePageItem(
                        iconData: FxBoxIcons.bx_book_open,
                        navigation: learning.SplashScreen(),
                        title: "Learning",
                      ),
                      SinglePageItem(
                        iconData: FxBoxIcons.bx_dish,
                        navigation: cookify.SplashScreen(),
                        title: "Cookify",
                      ),
                      SinglePageItem(
                        iconData: FxBoxIcons.bx_heart,
                        navigation: dating.SplashScreen(),
                        title: "Dating",
                      ),
                      SinglePageItem(
                        iconData: FxBoxIcons.bx_building_house,
                        navigation: estate.SplashScreen(),
                        title: "Estate",
                      ),
                      SinglePageItem(
                        iconData: FxBoxIcons.bx_cake,
                        navigation: homemade.SplashScreen(),
                        title: "Homemade",
                      ),
                    ]),
                FxContainer(
                  margin: FxSpacing.top(20),
                  borderRadiusAll: 4,
                  color: theme.colorScheme.primary.withAlpha(24),
                  child: Center(
                    child: FxText.bodyMedium(
                        "More widgets are coming very soon...",
                        fontWeight: 600,
                        color: theme.colorScheme.primary),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
