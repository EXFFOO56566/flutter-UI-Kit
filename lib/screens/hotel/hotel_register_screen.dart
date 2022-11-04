/*
* File : Hotel Register
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'hotel_full_app.dart';
import 'hotel_login_screen.dart';

class HotelRegisterScreen extends StatefulWidget {
  @override
  _HotelRegisterScreenState createState() => _HotelRegisterScreenState();
}

class _HotelRegisterScreenState extends State<HotelRegisterScreen> {
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
                child: FxText.titleLarge("Create an Account", fontWeight: 600),
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
                  hintText: "Username",
                  hintStyle: FxTextStyle.bodyLarge(
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
                    MdiIcons.accountOutline,
                    size: 22,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,
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
                  hintStyle: FxTextStyle.bodyLarge(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  hintText: "Email address",
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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                style: FxTextStyle.bodyLarge(
                    letterSpacing: 0.1,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                  hintStyle: FxTextStyle.bodyLarge(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  hintText: "Password",
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
                    MdiIcons.lockOutline,
                    size: 22,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
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
            FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              padding: FxSpacing.y(12),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelFullApp()));
              },
              child: FxText.bodyLarge("Register",
                  fontWeight: 600, color: theme.colorScheme.onPrimary),
            ),
            FxSpacing.height(20),
            Center(
              child: FxButton.text(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelLoginScreen()));
                },
                child: FxText.bodyMedium("I've already an account",
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
