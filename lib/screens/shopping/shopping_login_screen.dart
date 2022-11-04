/*
* File : Shopping Login
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'shopping_full_app.dart';
import 'shopping_password_screen.dart';
import 'shopping_register_screen.dart';

class ShoppingLoginScreen extends StatefulWidget {
  @override
  _ShoppingLoginScreenState createState() => _ShoppingLoginScreenState();
}

class _ShoppingLoginScreenState extends State<ShoppingLoginScreen> {
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
      margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 48),
      child: Column(
        children: <Widget>[
          Center(
            child: FxText.headlineSmall("Log In", fontWeight: 700),
          ),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: FxText.bodyLarge(
              "Enter your login details to access your account",
              softWrap: true,
              fontWeight: 500,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: FxContainer(
              paddingAll: 0,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(text: "denio@gmail.com"),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          style: FxTextStyle.bodyLarge(
                              fontWeight: 600, letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: FxTextStyle.bodyLarge(
                                fontWeight: 500,
                                letterSpacing: 0,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(180)),
                            hintText: "Your Password",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: true,
                        ),
                      ),
                      FxButton.text(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingPasswordScreen()));
                          },
                          child: FxText.bodyMedium("FORGOT",
                              letterSpacing: 0.5,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                              fontWeight: 700))
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: FxButton(
                  elevation: 0,
                  padding: FxSpacing.y(12),
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoppingFullApp()));
                  },
                  child: Center(
                    child: FxText.bodyMedium("CONTINUE",
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.8,
                        fontWeight: 700),
                  ))),
          FxSpacing.height(16),
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
