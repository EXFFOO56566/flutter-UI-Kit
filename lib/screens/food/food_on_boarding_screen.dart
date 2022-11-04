import 'package:flutkit/screens/food/food_login_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

class FoodOnboardingScreen extends StatefulWidget {
  @override
  _FoodOnboardingScreenState createState() => _FoodOnboardingScreenState();
}

class _FoodOnboardingScreenState extends State<FoodOnboardingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: FxOnBoarding(
            pages: <PageViewModel>[
              PageViewModel(
                theme.backgroundColor,
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-1.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30.0),
                      FxText.bodyLarge('The French Runner', fontWeight: 600),
                      SizedBox(height: 15.0),
                      FxText.bodyMedium(
                        'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        letterSpacing: 0.1,
                        fontWeight: 500,
                      ),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                theme.backgroundColor,
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-2.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30.0),
                      FxText.bodyLarge('Dinner service', fontWeight: 600),
                      SizedBox(height: 15.0),
                      FxText.bodyMedium(
                          'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: 500),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                theme.backgroundColor,
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-3.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30),
                      FxText.bodyLarge('Food delivery\nat a snap',
                          fontWeight: 600),
                      SizedBox(height: 15.0),
                      FxText.bodyMedium(
                          'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: 500),
                    ],
                  ),
                ),
              ),
            ],
            unSelectedIndicatorColor: theme.colorScheme.secondary,
            selectedIndicatorColor: theme.colorScheme.primary,
            doneWidget: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodLoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: FxText.titleSmall("DONE".toUpperCase(),
                    color: theme.colorScheme.primary, fontWeight: 700),
              ),
            ),
            skipWidget: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodLoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: FxText.titleSmall("Skip".toUpperCase(),
                    color: theme.colorScheme.secondary, fontWeight: 700),
              ),
            ),
          )));
    });
  }
}
