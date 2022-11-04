/*
* File : Register
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Register1Screen extends StatefulWidget {
  @override
  _Register1ScreenState createState() => _Register1ScreenState();
}

class _Register1ScreenState extends State<Register1Screen> {
  bool _passwordVisible = false;
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
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 3 / 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(48))),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: BackButton(
                  color: theme.colorScheme.onBackground,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 40,
                child: FxText.headlineSmall("REGISTER", fontWeight: 600),
              )
            ],
          ),
        ),
        FxContainer.bordered(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
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
                  prefixIcon: Icon(MdiIcons.accountOutline),
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
                    hintText: "Email",
                    hintStyle: FxTextStyle.titleSmall(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    prefixIcon: Icon(MdiIcons.emailOutline),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: "Number",
                    hintStyle: FxTextStyle.titleSmall(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    prefixIcon: Icon(MdiIcons.phoneOutline),
                  ),
                  keyboardType: TextInputType.number,
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
                    hintText: "Password",
                    hintStyle: FxTextStyle.titleSmall(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    prefixIcon: Icon(MdiIcons.lockOutline),
                    suffixIcon: IconButton(
                      icon: Icon(_passwordVisible
                          ? MdiIcons.eyeOutline
                          : MdiIcons.eyeOffOutline),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: _passwordVisible,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 24),
                  child: FxButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {},
                      child: FxText("REGISTER",
                          color: theme.colorScheme.onPrimary))),
            ],
          ),
        ),
      ],
    ));
  }
}
