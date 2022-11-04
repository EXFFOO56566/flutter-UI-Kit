import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PageNotFoundScreen extends StatefulWidget {
  @override
  _PageNotFoundScreenState createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {
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
        body: Container(
            child: Center(
          child: Image(
            image:
                AssetImage('./assets/illustration/shopping/page-not-found.png'),
          ),
        )));
  }
}
