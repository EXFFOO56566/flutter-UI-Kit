import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../theme/app_theme.dart';
import '../controllers/splash_controller.dart';

class DatingSplashScreen extends StatefulWidget {
  const DatingSplashScreen({Key? key}) : super(key: key);

  @override
  _DatingSplashScreenState createState() => _DatingSplashScreenState();
}

class _DatingSplashScreenState extends State<DatingSplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late DatingSplashController controller;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    FxControllerStore.resetStore();

    controller = FxControllerStore.putOrFind<DatingSplashController>(
        DatingSplashController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DatingSplashController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: customTheme.datingPrimary.withAlpha(80))),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/apps/dating/splash.png'),
                  ),
                  FxText.headlineMedium(
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
                      splashColor: customTheme.datingOnPrimary.withAlpha(60),
                      borderRadiusAll: 4,
                      backgroundColor: customTheme.datingPrimary,
                      child: FxText.bodyMedium(
                        'Find Someone',
                        color: customTheme.datingOnPrimary,
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
