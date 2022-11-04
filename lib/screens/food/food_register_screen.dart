import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import 'food_full_app.dart';
import 'food_login_screen.dart';

class FoodRegisterScreen extends StatefulWidget {
  @override
  _FoodRegisterScreenState createState() => _FoodRegisterScreenState();
}

class _FoodRegisterScreenState extends State<FoodRegisterScreen> {
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
            child: FxText.titleLarge("Create account".toUpperCase(),
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
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Icon(
                    FeatherIcons.user,
                    color: theme.colorScheme.onPrimary,
                    size: 16,
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
                        hintText: "Name",
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
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Icon(
                      FeatherIcons.mail,
                      color: theme.colorScheme.onPrimary,
                      size: 16,
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
                FxContainer(
                  paddingAll: 6,
                  color: theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  child: Icon(
                    FeatherIcons.lock,
                    color: theme.colorScheme.onPrimary,
                    size: 16,
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
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 4,
            padding: FxSpacing.y(12),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodFullApp()));
            },
            child: FxText.bodyMedium("Register".toUpperCase(),
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
                letterSpacing: 0.5),
          ),
          FxSpacing.height(20),
          FxButton.text(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodLoginScreen()));
            },
            child: FxText.bodyMedium("I have already an account",
                color: theme.colorScheme.onBackground,
                fontWeight: 500,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    ));
  }
}
