/*
* File : Cupertino Tabs
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CupertinoTabWidget extends StatefulWidget {
  @override
  _CupertinoTabWidgetState createState() => _CupertinoTabWidgetState();
}

class _CupertinoTabWidgetState extends State<CupertinoTabWidget> {
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: theme.colorScheme.secondary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MdiIcons.message)),
          BottomNavigationBarItem(icon: Icon(MdiIcons.text)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: FxText('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: FxText('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: FxText('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: FxText('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
