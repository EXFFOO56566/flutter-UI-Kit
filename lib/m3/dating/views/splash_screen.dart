import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../theme/app_theme.dart';
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

    theme = AppTheme.datingTheme;
    FxControllerStore.resetStore();
    controller =
        FxControllerStore.putOrFind<SplashController>(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/apps/dating/splash.png'),
                  ),
                  FxText.displaySmall(
                    'Find your \nBest matches',
                    fontWeight: 600,
                    textAlign: TextAlign.center,
                    fontSize: 28,
                    letterSpacing: 0,
                  ),
                  FxSpacing.height(32),
                  Container(
                    margin: FxSpacing.x(40),
                    child: FxButton.block(
                      onPressed: () {
                        controller.goToHomeScreen();
                      },
                      elevation: 0,
                      splashColor:
                          theme.colorScheme.primaryContainer.withAlpha(30),
                      borderRadiusAll: Constant.buttonRadius.large,
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.labelLarge(
                        'Find Someone',
                        color: theme.colorScheme.onPrimary,
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
