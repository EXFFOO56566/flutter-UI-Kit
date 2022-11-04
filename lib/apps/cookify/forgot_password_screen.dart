import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'full_app.dart';
import 'register_screen.dart';

class CookifyForgotPasswordScreen extends StatefulWidget {
  @override
  _CookifyForgotPasswordScreenState createState() =>
      _CookifyForgotPasswordScreenState();
}

class _CookifyForgotPasswordScreenState
    extends State<CookifyForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 200, 24, 0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: customTheme.cookifyPrimary,
              size: 64,
            ),
            FxSpacing.height(16),
            FxText.headlineSmall(
              "Forgot Password",
              color: customTheme.cookifyPrimary,
              fontWeight: 800,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: customTheme.cookifyPrimary,
              focusedBorderColor: customTheme.cookifyPrimary,
              prefixIconColor: customTheme.cookifyPrimary,
              labelTextColor: customTheme.cookifyPrimary,
              cursorColor: customTheme.cookifyPrimary,
            ),
            FxSpacing.height(32),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                backgroundColor: customTheme.cookifyPrimary,
                child: FxText.labelLarge(
                  "Forgot Password",
                  color: customTheme.cookifyOnPrimary,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => CookifyRegisterScreen()),
                  );
                },
                splashColor: customTheme.cookifyPrimary.withAlpha(40),
                child: FxText.bodySmall("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.cookifyPrimary))
          ],
        ),
      ),
    );
  }
}
