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
  late CustomTheme customTheme;

  late SplashController controller;

  @override
  void initState() {
    super.initState();
    FxControllerStore.resetStore();
    controller = FxControllerStore.putOrFind(SplashController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.muviPrimary.withAlpha(80))),
      home: FxBuilder<SplashController>(
          controller: controller,
          builder: (controller) {
            return _buildBody();
          }),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/apps/muvi/splash.jpg'),
            ),
          ),
          Center(
            child: Padding(
              padding: FxSpacing.fromLTRB(40, 100, 40, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.headlineSmall(
                    'Watch your favourite movies anytime, anywhere',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontWeight: 700,
                  ),
                  FxButton.block(
                    onPressed: () {
                      controller.goToLoginScreen();
                    },
                    backgroundColor: Color(0xa4161616),
                    borderRadiusAll: 4,
                    elevation: 0,
                    child: FxText.bodyLarge(
                      'Log In',
                      fontWeight: 700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
