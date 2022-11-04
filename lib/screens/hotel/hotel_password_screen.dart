/*
* File : Hotel Forgot Password
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'hotel_full_app.dart';
import 'hotel_register_screen.dart';

class HotelPasswordScreen extends StatefulWidget {
  @override
  _HotelPasswordScreenState createState() => _HotelPasswordScreenState();
}

class _HotelPasswordScreenState extends State<HotelPasswordScreen> {
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
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: Center(
                child: FxText.titleLarge("Forgot Password?", fontWeight: 600),
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
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
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
            FxSpacing.height(20),
            FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              padding: FxSpacing.y(12),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelFullApp()));
              },
              child: FxText.bodyMedium("Reset Password",
                  color: theme.colorScheme.onPrimary,
                  letterSpacing: 0.5,
                  fontWeight: 600),
            ),
            FxSpacing.height(20),
            Center(
              child: FxButton.text(
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
