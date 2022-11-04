/*
* File : Navigation Rail widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

class NavigationRailWidget extends StatefulWidget {
  @override
  _NavigationRailWidgetState createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  int _selectedIndex = 0;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
        child: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: customTheme.card,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ).autoDirection()),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              /*------------- Build Tabs -------------------*/
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: FxText.titleSmall('First',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.book_outlined),
                  selectedIcon: Icon(Icons.book),
                  label: FxText.titleSmall('Second',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: FxText.titleSmall('Third',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
              ],
            ),

            // This is the main content.
            Expanded(
              child: Container(
                child: Center(
                  child: FxText.titleMedium('Selected : $_selectedIndex',
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
