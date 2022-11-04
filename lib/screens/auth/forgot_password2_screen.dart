/*
* File : Forgot Password
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ForgotPassword2Screen extends StatefulWidget {
  @override
  _ForgotPassword2ScreenState createState() => _ForgotPassword2ScreenState();
}

class _ForgotPassword2ScreenState extends State<ForgotPassword2Screen> {
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
          top: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: <Widget>[
              FxContainer.bordered(
                color: theme.scaffoldBackgroundColor,
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 24, top: 8),
                      child:
                          FxText.titleLarge("FORGOT PASSWORD", fontWeight: 600),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: FxButton(
                                elevation: 0,
                                borderRadiusAll: 4,
                                onPressed: () {},
                                child: FxText.labelMedium("RESET PASSWORD",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onPrimary,
                                    letterSpacing: 0.5)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
