import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;

  late SplashController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    FxControllerStore.resetStore();
    controller = FxControllerStore.put(SplashController(this));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                  secondary: theme.colorScheme.primary.withAlpha(40))),
          builder: (context, child) {
            return Directionality(
                textDirection: AppTheme.textDirection, child: child!);
          },
          home: FxBuilder<SplashController>(
              controller: controller,
              builder: (controller) {
                return Scaffold(
                  body: Padding(
                    padding: FxSpacing.fromLTRB(
                        20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
                    child: Column(
                      children: [
                        FxContainer(
                          padding: FxSpacing.xy(48, 20),
                          color: theme.colorScheme.primaryContainer,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            fit: BoxFit.fill,
                            height: 300,
                            image: AssetImage(Images.shoppingSplash),
                          ),
                        ),
                        FxSpacing.height(40),
                        FxText.displaySmall(
                          'Find your next \nClothes here',
                          fontWeight: 700,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(20),
                        FxText.bodyMedium(
                          'Explore all the most trending clothes \nhere based on your interest and go \nshopping!',
                          xMuted: true,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(40),
                        FxButton.block(
                          onPressed: () {
                            controller.goToLoginScreen();
                          },
                          backgroundColor: theme.colorScheme.primary,
                          elevation: 0,
                          borderRadiusAll: 4,
                          child: FxText.labelLarge(
                            'Head on to explore !',
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
