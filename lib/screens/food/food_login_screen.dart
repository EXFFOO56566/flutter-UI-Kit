import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'food_full_app.dart';
import 'food_password_screen.dart';
import 'food_register_screen.dart';

class FoodLoginScreen extends StatefulWidget {
  @override
  _FoodLoginScreenState createState() => _FoodLoginScreenState();
}

class _FoodLoginScreenState extends State<FoodLoginScreen> {
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
      padding: FxSpacing.nBottom(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              './assets/icons/food-outline.png',
              color: theme.colorScheme.primary,
              width: 36,
              height: 36,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: FxText.titleLarge("Welcome back".toUpperCase(),
                color: theme.colorScheme.onBackground,
                fontWeight: 700,
                letterSpacing: 0.5),
          ),
          FxSpacing.height(20),
          FxContainer(
            borderRadiusAll: 4,
            paddingAll: 12,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Icon(
                      FeatherIcons.mail,
                      color: theme.colorScheme.onPrimary,
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                )
              ],
            ),
          ),
          FxSpacing.height(20),
          FxContainer(
            borderRadiusAll: 4,
            paddingAll: 12,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Icon(
                      MdiIcons.lockOutline,
                      color: theme.colorScheme.onPrimary,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                )
              ],
            ),
          ),
          FxSpacing.height(20),
          Align(
            alignment: Alignment.topRight,
            child: FxButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodPasswordScreen()));
              },
              elevation: 0,
              padding: FxSpacing.right(0),
              borderRadiusAll: 4,
              child: FxText.bodyMedium("Forgot password",
                  color: theme.colorScheme.primary,
                  letterSpacing: 0,
                  fontWeight: 500),
            ),
          ),
          FxSpacing.height(20),
          FxButton.block(
            padding: FxSpacing.y(12),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodFullApp()));
            },
            child: FxText.bodyMedium("Login".toUpperCase(),
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
                letterSpacing: 0.5),
            elevation: 0,
            borderRadiusAll: 4,
          ),
          FxSpacing.height(20),
          FxButton.text(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodRegisterScreen()));
            },
            child: FxText.bodyMedium("I haven't an account",
                color: theme.colorScheme.primary,
                fontWeight: 500,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    ));
  }
}
