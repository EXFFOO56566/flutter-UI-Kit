// ignore: unused_import
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

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
        backgroundColor: theme.backgroundColor,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(
                      './assets/illustration/shopping/maintenance.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: FxText.bodyLarge("We will be back soon",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0.2),
              ),
              Container(
                margin: EdgeInsets.only(left: 56, right: 56, top: 24),
                child: FxText.bodyMedium(
                  "FlutKit is getting some tune up and some love. We'll be back soon, Thanks for your patience!",
                  letterSpacing: 0,
                  fontWeight: 500,
                  height: 1.2,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
