/*
* File : Notification Setting
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool _showNotification = true;
  bool _allowIcon = true;
  bool _showLock = false;
  bool _reaction = true;
  bool _sound = true;
  bool _pushTip = true;
  bool _appSound = false;
  bool _appBanner = true;
  bool _appTip = false;

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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: FxText.titleMedium("Notifications", fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child:
                      FxText.titleMedium("Show notifications", fontWeight: 600),
                ),
                Switch(
                  onChanged: (bool value) {
                    setState(() {
                      _showNotification = value;
                    });
                  },
                  value: _showNotification,
                  activeColor: theme.colorScheme.primary,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                      FxText.titleMedium("Allow icon badge", fontWeight: 600),
                ),
                Switch(
                  onChanged: (bool value) {
                    setState(() {
                      _allowIcon = value;
                    });
                  },
                  value: _allowIcon,
                  activeColor: theme.colorScheme.primary,
                )
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodySmall("Push notification".toUpperCase(),
                  fontWeight: 600,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                  letterSpacing: 0.3),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FxText.bodyLarge("Show on Lock Screen",
                              fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Show notification when mobile is locked",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _showLock = value;
                        });
                      },
                      value: _showLock,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Reactions", fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Receive notification when someone react to your message",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _reaction = value;
                        });
                      },
                      value: _reaction,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Sounds", fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Play sound for new message",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _sound = value;
                        });
                      },
                      value: _sound,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Tips \& Tricks", fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Receive notification when new product feature",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _pushTip = value;
                        });
                      },
                      value: _pushTip,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodySmall("In-app notification".toUpperCase(),
                  fontWeight: 600,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                  letterSpacing: 0.3),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("In-app sounds", fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Play notification sound when using app",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _appSound = value;
                        });
                      },
                      value: _appSound,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Chat Banner Notification",
                              fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Show banner notification when new message arrive",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _appBanner = value;
                        });
                      },
                      value: _appBanner,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Tips \& Tricks", fontWeight: 600),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: FxText.bodySmall(
                                  "Receive notification when new product feature",
                                  fontWeight: 400,
                                  letterSpacing: 0,
                                  height: 1)),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.dividerColor,
                      thickness: 1.2,
                    ),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          _appTip = value;
                        });
                      },
                      value: _appTip,
                      activeColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
