import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'single_news_screen.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: FxSpacing.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      child: Image(
                        image:
                            AssetImage('./assets/images/profile/avatar_2.jpg'),
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    child: FxText.bodyMedium("19 Jan, 2020",
                        color: theme.colorScheme.onBackground, fontWeight: 400),
                  )
                ],
              ),
              Container(
                margin: FxSpacing.top(16),
                child: FxText.headlineMedium("Breaking News",
                    color: theme.colorScheme.onBackground, fontWeight: 800),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: FxSpacing.top(24),
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                            color: customTheme.shadowColor.withAlpha(120),
                            blurRadius: 24,
                            spreadRadius: 4)
                      ]),
                  child: Column(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l2.jpg'),
                        ),
                      ),
                      Container(
                        padding: FxSpacing.all(16),
                        child: Column(
                          children: [
                            Container(
                              child: FxText.titleLarge(
                                  "14 Passengers Banned By Nona Airlines After bad Behaviour",
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            Container(
                              margin: FxSpacing.top(16),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    child: Image(
                                      image: AssetImage(
                                          './assets/images/profile/avatar_2.jpg'),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  FxText.bodySmall("John smith",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      xMuted: true),
                                  Expanded(child: Container()),
                                  FxText.bodySmall("10 Jan, 2020",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: FxSpacing.top(24),
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l2.jpg'),
                          width: 90,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            FxText.bodyMedium(
                                "An illinois town fights to save its power plant",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            Container(
                              margin: FxSpacing.top(8),
                              child: Row(
                                children: [
                                  Icon(
                                    MdiIcons.calendarOutline,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FxText.labelSmall("Jan 10, 2021",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(
                                    MdiIcons.clockOutline,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FxText.labelSmall("10 min read",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: FxSpacing.top(24),
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l3.jpg'),
                          width: 90,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            FxText.bodyMedium(
                                "An illinois town fights to save its power plant",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            Container(
                              margin: FxSpacing.top(8),
                              child: Row(
                                children: [
                                  Icon(
                                    MdiIcons.calendarOutline,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FxText.labelSmall("Jan 10, 2021",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(
                                    MdiIcons.clockOutline,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FxText.labelSmall("10 min read",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: Row(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Image(
                        image: AssetImage('./assets/images/all/all-l1.jpg'),
                        width: 90,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          FxText.bodyMedium(
                              "An illinois town fights to save its power plant",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          Container(
                            margin: FxSpacing.top(8),
                            child: Row(
                              children: [
                                Icon(
                                  MdiIcons.calendarOutline,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(160),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                FxText.labelSmall("Jan 10, 2021",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    muted: true),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  MdiIcons.clockOutline,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(160),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                FxText.labelSmall("10 min read",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    muted: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
