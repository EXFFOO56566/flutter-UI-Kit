import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutkit/theme/app_theme.dart';

class FxBottomNavigationScreen extends StatefulWidget {
  @override
  _FxBottomNavigationScreenState createState() =>
      _FxBottomNavigationScreenState();
}

class _FxBottomNavigationScreenState extends State<FxBottomNavigationScreen> {
  FxBottomNavigationBarType bottomNavigationBarType =
      FxBottomNavigationBarType.normal;
  Axis labelDirection = Axis.horizontal;
  bool showLabel = false, showActiveLabel = false;
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
      body: Column(
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: FxText.titleSmall(
                    "Type - (" +
                        (bottomNavigationBarType ==
                                FxBottomNavigationBarType.containered
                            ? "Containered"
                            : "Normal") +
                        ")",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        bottomNavigationBarType = value
                            ? FxBottomNavigationBarType.containered
                            : FxBottomNavigationBarType.normal;
                      });
                    },
                    value: bottomNavigationBarType ==
                        FxBottomNavigationBarType.containered,
                  ),
                ),
                ListTile(
                  title: FxText.titleSmall(
                    "Show Active Label",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        showActiveLabel = value;
                      });
                    },
                    value: showActiveLabel,
                  ),
                ),
                ListTile(
                  title: FxText.titleSmall(
                    "Show Label",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        showLabel = value;
                      });
                    },
                    value: showLabel,
                  ),
                ),
                ListTile(
                  title: FxText.titleSmall(
                    "Label Direction (" +
                        (labelDirection == Axis.horizontal
                            ? "Horizontal"
                            : "Vertical") +
                        ")",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        labelDirection =
                            value ? Axis.horizontal : Axis.vertical;
                      });
                    },
                    value: labelDirection == Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FxBottomNavigationBar(
              containerDecoration: BoxDecoration(
                  color: customTheme.cardDark,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        color: customTheme.shadowColor.withAlpha(200),
                        offset: Offset(8, 0),
                        blurRadius: 8)
                  ]),
              activeContainerColor: theme.colorScheme.primary.withAlpha(30),
              fxBottomNavigationBarType: bottomNavigationBarType,
              showActiveLabel: showActiveLabel,
              showLabel: showLabel,
              activeIconSize: 22,
              iconSize: 22,
              titleSize: 12,
              activeTitleSize: 12,
              labelDirection: labelDirection,
              activeIconColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onBackground.withAlpha(140),
              itemList: [
                FxBottomNavigationBarItem(
                  page: Screen1(),
                  title: "Home",
                  activeIconData: Icons.house,
                  iconData: Icons.house_outlined,
                ),
                FxBottomNavigationBarItem(
                  page: Screen2(),
                  title: "Plan",
                  activeIconData: Icons.date_range,
                  iconData: Icons.date_range_outlined,
                ),
                FxBottomNavigationBarItem(
                  page: Screen3(),
                  title: "Chat",
                  activeIconData: Icons.chat_bubble,
                  iconData: Icons.chat_bubble_outline_rounded,
                ),
                FxBottomNavigationBarItem(
                  page: Screen4(),
                  title: "Profile",
                  activeIconData: Icons.person,
                  iconData: Icons.person_outline_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: customTheme.cardDark,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customTheme.cardDark,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(FeatherIcons.chevronLeft),
        ),
        title: FxText.titleMedium("Bottom Navigation Bar", fontWeight: 600),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FxText.titleLarge('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FxText.titleLarge('Screen 2'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FxText.titleLarge('Screen 3'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FxText.titleLarge('Screen 4'),
    );
  }
}
