/*
* File : Account Setting
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
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
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: FxText.titleMedium("Account Setting", fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            FxText.bodyLarge("Personal information",
                fontWeight: 600, letterSpacing: 0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
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
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: TextFormField(
                      style: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Number",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
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
                          MdiIcons.phoneOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 0),
              child: FxText.bodyLarge("Company information",
                  fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
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
                          MdiIcons.domain,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: TextFormField(
                      style: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Job Title",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
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
                          MdiIcons.briefcaseOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: TextFormField(
                      style: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Website",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
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
                          MdiIcons.web,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: FxText.bodyLarge("Change Password",
                  fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                style: FxTextStyle.titleSmall(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Old Password",
                  hintStyle: FxTextStyle.titleSmall(
                      letterSpacing: 0,
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
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,
                obscureText: _passwordVisible,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: TextFormField(
                style: FxTextStyle.titleSmall(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: " Password",
                  hintStyle: FxTextStyle.titleSmall(
                      letterSpacing: 0,
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
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,
                obscureText: _passwordVisible,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withAlpha(28),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: FxText.bodyMedium("SAVE",
                        fontWeight: 600, color: theme.colorScheme.onPrimary),
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
