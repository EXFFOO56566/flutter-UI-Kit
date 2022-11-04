/*
* File : Music Login
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'music_full_app.dart';
import 'music_password_screen.dart';
import 'music_register_screen.dart';

class MusicLoginScreen extends StatefulWidget {
  @override
  _MusicLoginScreenState createState() => _MusicLoginScreenState();
}

class _MusicLoginScreenState extends State<MusicLoginScreen> {
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
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: FxText.headlineSmall("Sign in",
                  fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
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
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
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
                        Radius.circular(4),
                      ),
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide:
                          BorderSide(color: customTheme.border, width: 1.2)),
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
                padding: FxSpacing.x(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MusicPasswordScreen()));
                },
                child: FxText.bodyMedium(
                  "Forgot Password ?",
                  fontWeight: 500,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            FxSpacing.height(20),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Color(0xffe33239),
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(100),
                      highlightColor: theme.colorScheme.primary,
                      // inkwell color
                      child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Icon(MdiIcons.google,
                              color: Colors.white, size: 20)),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: ClipOval(
                    child: Material(
                      color: Color(0xff335994),
                      child: InkWell(
                        splashColor: Colors.white.withAlpha(100),
                        highlightColor: theme.colorScheme.primary,
                        // inkwell color
                        child: SizedBox(
                            width: 36,
                            height: 36,
                            child: Center(
                                child: FxText.titleLarge("F",
                                    color: Colors.white, letterSpacing: 0))),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                FxSpacing.width(32),
                Expanded(
                  child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MusicFullApp()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FxText.bodyMedium("NEXT",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.5),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Icon(
                            MdiIcons.chevronRight,
                            color: theme.colorScheme.onPrimary,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicRegisterScreen()));
                  },
                  child: FxText.bodyMedium("I haven't an account",
                      color: theme.colorScheme.primary,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
