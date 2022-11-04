import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
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
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Icon(
                MdiIcons.wifiStrengthOffOutline,
                size: 64,
                color: theme.colorScheme.primary,
              )),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: FxText.titleLarge("Whoops",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0.2),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Column(
                  children: <Widget>[
                    FxText.bodyLarge(
                      "Slow or no internet connection",
                      letterSpacing: 0,
                      fontWeight: 500,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: FxText.bodyLarge(
                        "Please check your internet settings",
                        letterSpacing: 0,
                        fontWeight: 500,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {},
                    child: FxText.labelMedium("Try again",
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.5)),
              ),
            ],
          ),
        ));
  }
}
