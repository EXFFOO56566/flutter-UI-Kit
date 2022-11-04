import 'package:flutkit/animations/favorite/favorite_screen.dart';
import 'package:flutkit/animations/flip/flip_screen.dart';
import 'package:flutkit/animations/intro_tour/intro_screen.dart';
import 'package:flutkit/animations/radial_menu/radial_menu_screen.dart';
import 'package:flutkit/animations/resizing_house/resizing_house_screen.dart';
import 'package:flutkit/animations/switch/switch_screen.dart';
import 'package:flutkit/animations/theme_changer/theme_changer_screen.dart';
import 'package:flutkit/homes/single_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../animations/auth/login_screen.dart';
import '../theme/app_notifier.dart';
import '../theme/app_theme.dart';

class AnimationsHome extends StatefulWidget {
  const AnimationsHome({Key? key}) : super(key: key);

  @override
  _AnimationsHomeState createState() => _AnimationsHomeState();
}

class _AnimationsHomeState extends State<AnimationsHome> {
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
        return Container(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
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
                      title: "Auth",
                      icon: './assets/icons/auth-outline.png',
                      navigation: LogInScreen(),
                    ),
                    SinglePageItem(
                      title: "Favorite",
                      icon: './assets/icons/heart_outline.png',
                      navigation: FavoriteScreen(),
                    ),
                    SinglePageItem(
                      title: "Theme Changer",
                      icon: './assets/icons/sun_outline.png',
                      navigation: ThemeChangerScreen(),
                    ),
                    SinglePageItem(
                      title: "Intro Tour",
                      icon: './assets/icons/range_selector_outline.png',
                      navigation: IntroScreen(),
                    ),
                    SinglePageItem(
                      title: "Resizing House",
                      icon: './assets/icons/resize_outline.png',
                      navigation: ResizingHouseScreen(),
                    ),
                    SinglePageItem(
                      title: "Switch",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: SwitchScreen(),
                    ),
                    SinglePageItem(
                      title: "Flip",
                      icon: './assets/icons/repeat.png',
                      navigation: FlipScreen(),
                    ),
                    SinglePageItem(
                      title: "Radial Menu",
                      icon: './assets/icons/sun_outline.png',
                      navigation: RadialMenuScreen(),
                    ),
                  ]),
            ],
          ),
        );
      },
    );
  }
}
