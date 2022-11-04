import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/splash_controller.dart';

class EstateSplashScreen extends StatefulWidget {
  const EstateSplashScreen({Key? key}) : super(key: key);

  @override
  _EstateSplashScreenState createState() => _EstateSplashScreenState();
}

class _EstateSplashScreenState extends State<EstateSplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SplashController controller;

  @override
  initState() {
    super.initState();

    FxControllerStore.resetStore();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.estatePrimary.withAlpha(80))),
      debugShowCheckedModeBanner: false,
      home: FxBuilder<SplashController>(
          controller: controller,
          builder: (controller) {
            return Scaffold(
              body: Stack(
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/apps/estate/estate16.jpg"),
                  ),
                  Positioned(
                    top: 132,
                    left: 0,
                    right: 0,
                    child: FxText.displaySmall(
                      'Let\'s Find Your',
                      color: customTheme.estateOnPrimary,
                      textAlign: TextAlign.center,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: FxText.displaySmall(
                      'Dream Home',
                      color: customTheme.estateOnPrimary,
                      textAlign: TextAlign.center,
                      fontWeight: 800,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: FxCard(
                      onTap: () {
                        controller.goToSearchScreen();
                      },
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      paddingAll: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.bodyMedium(
                            'Search by location...',
                            fontWeight: 700,
                            color: customTheme.estatePrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    child: FxCard(
                      onTap: () {
                        controller.goToLogin();
                      },
                      paddingAll: 24,
                      color: customTheme.estatePrimary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.bodyMedium(
                            'Join Now',
                            fontWeight: 700,
                            color: customTheme.estateOnPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
