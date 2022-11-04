/*
* File : Hotel Login
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'hotel_full_app.dart';
import 'hotel_password_screen.dart';
import 'hotel_register_screen.dart';

class HotelLoginScreen extends StatefulWidget {
  @override
  _HotelLoginScreenState createState() => _HotelLoginScreenState();
}

class _HotelLoginScreenState extends State<HotelLoginScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: Center(
                child: FxText.titleLarge("Welcome Back", fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                style: FxTextStyle.bodyLarge(
                    letterSpacing: 0.1,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Email address",
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
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(
                    MdiIcons.emailOutline,
                    size: 22,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                autofocus: false,
                obscureText: _passwordVisible,
                style: FxTextStyle.bodyLarge(
                    letterSpacing: 0.1,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintStyle: FxTextStyle.titleSmall(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  hintText: "Password",
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
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(
                    MdiIcons.lockOutline,
                    size: 22,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _passwordVisible = _passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? MdiIcons.eyeOutline
                          : MdiIcons.eyeOffOutline,
                      size: 22,
                    ),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            FxSpacing.height(20),
            Container(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                padding: FxSpacing.zero,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelPasswordScreen()));
                },
                child: FxText.bodyMedium(
                  "Forgot Password ?",
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            FxSpacing.height(20),
            FxButton.block(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelFullApp()));
              },
              child: FxText.bodyMedium(
                "Sign in",
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            FxSpacing.height(20),
            Center(
              child: FxButton.text(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelRegisterScreen()));
                },
                child: FxText.bodyMedium(
                  "I haven't an account",
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
