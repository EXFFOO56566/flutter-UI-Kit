import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    FxControllerStore.resetStore();
    controller = FxControllerStore.putOrFind(SplashController());
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FxContainer(
                          margin: FxSpacing.x(20),
                          color: theme.colorScheme.primaryContainer,
                          borderRadiusAll: Constant.containerRadius.medium,
                          child: Image(
                            image: AssetImage(Images.learningSplash),
                          ),
                        ),
                        FxSpacing.height(48),
                        FxText.displayLarge('Nourish your \ninner skills',
                            fontWeight: 700, textAlign: TextAlign.center),
                        FxSpacing.height(20),
                        FxText.bodyMedium(
                          'Choose your favorite course and start learning.',
                          xMuted: true,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(20),
                        Container(
                          margin: FxSpacing.x(20),
                          child: FxButton.block(
                            onPressed: () {
                              controller.goToLogInScreen();
                            },
                            backgroundColor: theme.colorScheme.primary,
                            splashColor:
                                theme.colorScheme.onPrimary.withAlpha(30),
                            elevation: 0,
                            borderRadiusAll: Constant.buttonRadius.large,
                            child: FxText.labelLarge(
                              'Get Started',
                              color: theme.colorScheme.onPrimary,
                            ),
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
