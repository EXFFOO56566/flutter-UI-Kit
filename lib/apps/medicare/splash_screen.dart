import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediCareSplashScreen extends StatefulWidget {
  @override
  _MediCareSplashScreenState createState() => _MediCareSplashScreenState();
}

class _MediCareSplashScreenState extends State<MediCareSplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w200,
      200: FontWeight.w300,
      300: FontWeight.w400,
      400: FontWeight.w500,
      500: FontWeight.w600,
      600: FontWeight.w700,
      700: FontWeight.w800,
      800: FontWeight.w900,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.medicarePrimary)),
      child: Scaffold(
        body: Container(
          margin: FxSpacing.fromLTRB(24, 100, 24, 32),
          child: Column(
            children: [
              FxText.displaySmall(
                "Welcome to MediCare",
                color: customTheme.medicarePrimary,
              ),
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage(
                        'assets/images/apps/medicare/medicare_splash_screen.png'),
                    width: 320,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: FxButton.text(
                    splashColor: customTheme.medicarePrimary.withAlpha(40),
                    padding: FxSpacing.y(12),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => MediCareRegistrationScreen()),
                      );
                    },
                    child: FxText.labelLarge(
                      "SIGN UP",
                      color: customTheme.medicarePrimary,
                      letterSpacing: 0.5,
                    ),
                  )),
                  Expanded(
                      child: FxButton(
                    elevation: 0,
                    padding: FxSpacing.y(12),
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => MediCareLoginScreen()),
                      );
                    },
                    child: FxText.labelLarge(
                      "LOG IN",
                      color: customTheme.medicareOnPrimary,
                      letterSpacing: 0.5,
                    ),
                    backgroundColor: customTheme.medicarePrimary,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
