import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 32, 20, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image(),
                    FxSpacing.height(40),
                    FxText.titleLarge(
                      "Hey! Welcome",
                      fontWeight: 800,
                    ),
                    FxSpacing.height(20),
                    FxText.bodyMedium(
                      "This is a best-fit app to invest in Cryptocurrency for beginners and do trading.",
                      textAlign: TextAlign.center,
                    ),
                    FxSpacing.height(20),
                    register(),
                    FxSpacing.height(20),
                    login(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget image() {
    return Image(
      height: 120,
      width: 120,
      color: theme.colorScheme.primary,
      image: AssetImage('assets/images/full_apps/nft/icons/splash.png'),
    );
  }

  Widget register() {
    return FxButton.block(
      onPressed: () {
        controller.goToLoginScreen();
      },
      borderRadiusAll: 4,
      elevation: 0,
      child: FxText.labelLarge(
        "Get Started",
        color: theme.colorScheme.onPrimary,
        fontWeight: 600,
      ),
    );
  }

  Widget login() {
    return FxButton.block(
      onPressed: () {
        controller.goToLoginScreen();
      },
      elevation: 0,
      borderRadiusAll: 4,
      backgroundColor: theme.cardTheme.color,
      child: FxText.labelLarge(
        "I already have an account",
        color: theme.colorScheme.onBackground,
        fontWeight: 600,
      ),
    );
  }
}
