import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
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
  initState() {
    super.initState();

    FxControllerStore.resetStore();
    theme = AppTheme.estateTheme;

    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
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
                      color: theme.colorScheme.onPrimary,
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
                      color: theme.colorScheme.onPrimary,
                      textAlign: TextAlign.center,
                      fontWeight: 800,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: FxContainer(
                      onTap: () {
                        controller.goToSearchScreen();
                      },
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(Constant.containerRadius.large),
                          topRight:
                              Radius.circular(Constant.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      paddingAll: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.bodyMedium(
                            'Search by location...',
                            fontWeight: 700,
                            color: theme.colorScheme.primary,
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
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(Constant.containerRadius.large),
                          bottomRight:
                              Radius.circular(Constant.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.bodyMedium(
                            'Join Now',
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimary,
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
