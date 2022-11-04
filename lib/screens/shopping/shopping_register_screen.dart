import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'shopping_full_app.dart';
import 'shopping_login_screen.dart';

class ShoppingRegisterScreen extends StatefulWidget {
  @override
  _ShoppingRegisterScreenState createState() => _ShoppingRegisterScreenState();
}

class _ShoppingRegisterScreenState extends State<ShoppingRegisterScreen> {
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
          Center(
            child: FxText.headlineSmall("Create an Account", fontWeight: 600),
          ),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: FxText.bodyLarge(
              "Enter your details to create new your account",
              softWrap: true,
              fontWeight: 600,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: FxContainer.none(
              borderRadiusAll: 4,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: FxTextStyle.bodyLarge(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground.withAlpha(180)),
                      hintText: "Username",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: FxTextStyle.bodyLarge(
                          fontWeight: 600,
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: FxTextStyle.bodyLarge(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground.withAlpha(180)),
                      hintText: "Your Password",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: true,
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: FxButton.block(
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: 4,
                padding: FxSpacing.y(12),
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingFullApp()));
                },
                child: FxText.bodyMedium("CONTINUE",
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.8,
                    fontWeight: 700),
              )),
          Center(
            child: FxButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingLoginScreen()));
              },
              child: FxText.bodyMedium("I have an account",
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ));
  }
}
