import 'package:flutkit/m3/cookify/controllers/splash_controller.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(SplashController());
    FxControllerStore.resetStore();
    FxTextStyle.changeFontFamily(GoogleFonts.mali);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
              colorScheme: theme.colorScheme
                  .copyWith(secondary: theme.colorScheme.primaryContainer)),
          builder: (context, child) {
            return Directionality(
                textDirection: AppTheme.textDirection, child: child!);
          },
          home: FxBuilder<SplashController>(
              controller: controller,
              builder: (controller) {
                return Scaffold(
                  body: Container(
                    margin: FxSpacing.fromLTRB(24, 100, 24, 32),
                    child: Column(
                      children: [
                        FxText.displaySmall(
                          "Welcome to Cookify",
                          color: theme.colorScheme.primary,
                        ),
                        Expanded(
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                  './assets/images/apps/cookify/splash-1.png'),
                              width: 320,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: FxButton.text(
                              splashColor: theme.colorScheme.primaryContainer,
                              padding: FxSpacing.y(12),
                              onPressed: () {
                                controller.goToRegisterScreen();
                              },
                              child: FxText.labelLarge(
                                "SIGN UP",
                                color: theme.colorScheme.primary,
                                letterSpacing: 0.5,
                              ),
                            )),
                            Expanded(
                                child: FxButton(
                              elevation: 0,
                              padding: FxSpacing.y(12),
                              borderRadiusAll: Constant.buttonRadius.large,
                              splashColor:
                                  theme.colorScheme.onPrimary.withAlpha(40),
                              onPressed: () {
                                controller.goToLogInScreen();
                              },
                              child: FxText.labelLarge(
                                "LOG IN",
                                color: theme.colorScheme.onPrimary,
                                letterSpacing: 0.5,
                              ),
                              backgroundColor: theme.colorScheme.primary,
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
