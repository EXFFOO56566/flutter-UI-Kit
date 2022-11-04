/*
* File : Register
* Version : 1.0.0
* */

import 'package:flutkit/screens/auth/login2_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Register2Screen extends StatefulWidget {
  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
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
        body: Stack(
      children: <Widget>[
        ClipPath(
            clipper: _MyCustomClipper(context),
            child: Container(
              alignment: Alignment.center,
              color: theme.colorScheme.background,
            )),
        Positioned(
          left: 30,
          right: 30,
          top: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: <Widget>[
              FxContainer.bordered(
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: FxText.titleLarge("REGISTER", fontWeight: 600),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: FxTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: FxTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: Icon(MdiIcons.accountOutline),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: FxTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: FxTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: Icon(MdiIcons.emailOutline),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: FxTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Number",
                                hintStyle: FxTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: Icon(MdiIcons.phoneOutline),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: FxTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: FxTextStyle.bodyLarge(
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
                                  child: FxText.labelMedium("REGISTER",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login2Screen()));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "I've already an Account? ",
                          style: FxTextStyle.bodyMedium(fontWeight: 500)),
                      TextSpan(
                          text: " Login",
                          style: FxTextStyle.bodyMedium(
                              fontWeight: 600,
                              color: theme.colorScheme.primary)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: FxSpacing.safeAreaTop(context) + 12,
          left: 16,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
        )
      ],
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
