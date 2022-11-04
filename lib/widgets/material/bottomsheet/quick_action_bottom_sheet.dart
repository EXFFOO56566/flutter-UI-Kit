/*
* File : Quick Action Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class QuickActionBottomSheet extends StatefulWidget {
  @override
  _QuickActionBottomSheetState createState() => _QuickActionBottomSheetState();
}

class _QuickActionBottomSheetState extends State<QuickActionBottomSheet> {
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
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            child: Icon(
              Icons.flash_on_outlined,
              size: 26,
              color: theme.colorScheme.onPrimary,
            ),
            elevation: 2,
            backgroundColor: theme.colorScheme.primary),
        body: Center(
          child: FxText.titleSmall(
            "Tap on FAB",
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: FxSpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxText.titleMedium("Quick Action", fontWeight: 700),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.phone_outlined,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.subway_outlined,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData:
                                          Icons.local_gas_station_outlined,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.light_outlined,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.tv,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.camera_outlined,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.phone_outlined,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.play_arrow_outlined,
                                      actionText: 'G Play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.umbrella_outlined,
                                      actionText: 'Insurance',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: FxSpacing.y(12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: FxSpacing.top(4),
            child: FxText.bodySmall(actionText, fontWeight: 600),
          )
        ],
      ),
    );
  }
}
