/*
* File : Edit Profile
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "./assets/images/profile/avatar_4.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: theme.scaffoldBackgroundColor,
                                width: 2,
                                style: BorderStyle.solid),
                            color: theme.colorScheme.primary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              MdiIcons.pencil,
                              size: 20,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  FxText.titleLarge("Marcelina Willis",
                      fontWeight: 600, letterSpacing: 0),
                  FxText.titleSmall("UI Designer", fontWeight: 500),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 36, left: 24, right: 24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                          MdiIcons.accountOutline,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      controller:
                          TextEditingController(text: "Marcelina Willis"),
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
                        hintText: "Email",
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
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: TextEditingController(text: "nat@gmail.com"),
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
                        hintText: "Phone",
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
                          MdiIcons.phoneOutline,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                      controller: TextEditingController(text: "091-987456321"),
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
                        hintText: "Change Password",
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
                          MdiIcons.lockOutline,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: _passwordVisible,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: FxButton(
                        onPressed: () {},
                        borderRadiusAll: 4,
                        elevation: 0,
                        child: FxText.labelMedium("UPDATE",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.3)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
