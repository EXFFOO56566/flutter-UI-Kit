import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'shopping_full_app.dart';
import 'shopping_register_screen.dart';

class ShoppingPasswordScreen extends StatefulWidget {
  @override
  _ShoppingPasswordScreenState createState() => _ShoppingPasswordScreenState();
}

class _ShoppingPasswordScreenState extends State<ShoppingPasswordScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 48),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Center(
                child: FxText.headlineSmall("Reset Password", fontWeight: 700),
              )),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: FxText.bodyLarge(
              "Enter your email address to reset your password",
              softWrap: true,
              fontWeight: 500,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: FxContainer.none(
              borderRadiusAll: 4,
              child: TextFormField(
                style:
                    FxTextStyle.bodyLarge(fontWeight: 500, letterSpacing: 0.2),
                decoration: InputDecoration(
                  hintStyle: FxTextStyle.bodyLarge(
                      fontWeight: 500,
                      letterSpacing: 0,
                      color: theme.colorScheme.onBackground.withAlpha(180)),
                  hintText: "Email Address",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(16),
                ),
                autofocus: false,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: FxButton.block(
                borderRadiusAll: 4,
                elevation: 0,
                padding: FxSpacing.y(12),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingFullApp()));
                },
                child: FxText.bodyMedium("RESET PASSWORD",
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.6,
                    fontWeight: 700),
              )),
          FxSpacing.height(8),
          Center(
            child: FxButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingRegisterScreen()));
              },
              child: FxText.bodyMedium("I haven't an account",
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ));
  }
}
