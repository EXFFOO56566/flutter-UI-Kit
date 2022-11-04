import 'package:flutkit/full_apps/shopping/controllers/splash_screen2_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  late ThemeData theme;

  late SplashScreen2Controller controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.putOrFind(SplashScreen2Controller());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashScreen2Controller>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "splash_username",
                    child: FxText.titleLarge(
                      "Hey Nency,",
                      fontWeight: 700,
                    ),
                  ),
                  FxText.bodySmall(
                    "Wait here, we are fetching data",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
