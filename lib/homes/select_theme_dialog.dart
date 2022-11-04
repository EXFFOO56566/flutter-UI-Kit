import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/theme_type.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../theme/app_theme.dart';

class SelectThemeDialog extends StatefulWidget {
  @override
  _SelectThemeDialogState createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  late ThemeData themeData;

  void _handleRadioValueChange(ThemeType? themeType) {
    Navigator.of(context).pop();
    setState(() {
      Provider.of<AppNotifier>(context, listen: false).updateTheme(themeType!);
    });
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _handleRadioValueChange(ThemeType.light);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: AppTheme.themeType,
                          value: ThemeType.light,
                          activeColor: themeData.colorScheme.primary,
                        ),
                        FxText.titleSmall(
                          "Light Theme",
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.lightTheme.backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.lightTheme.colorScheme.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.lightTheme.colorScheme.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange(ThemeType.dark);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: AppTheme.themeType,
                          value: ThemeType.dark,
                          activeColor: themeData.colorScheme.secondary,
                        ),
                        FxText.titleSmall("Dark Theme"),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.darkTheme.backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.darkTheme.colorScheme.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.onBackground,
                                  width: 1),
                              color: AppTheme.darkTheme.colorScheme.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: FxText.bodyMedium(
                    "More themes are coming soon...",
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
