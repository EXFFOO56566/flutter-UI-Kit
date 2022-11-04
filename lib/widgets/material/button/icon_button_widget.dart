/*
* File : Icon Button
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class IconButtonWidget extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<IconButtonWidget> {
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
          title: FxText.titleMedium("Icon Button", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: FxText.titleSmall("Filled Buttons",
                            color: theme.colorScheme.onBackground),
                      ),
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.blue, // button color
                              child: InkWell(
                                splashColor: Colors.white,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(Icons.add)),
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.green,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  // inkwell color
                                  child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(Icons.menu)),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.red, // button color
                                child: InkWell(
                                  splashColor: Colors.white,
                                  // inkwell color
                                  child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(Icons.share)),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: FxText.titleSmall("Outline Buttons",
                            color: theme.colorScheme.onBackground),
                      ),
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  side: BorderSide(color: Colors.blue)),
                              child: InkWell(
                                splashColor: Colors.blue,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.add,
                                      color: theme.colorScheme.onBackground,
                                    )),
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                // button color
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    side: BorderSide(color: Colors.green)),
                                child: InkWell(
                                  splashColor: Colors.green,
                                  child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(
                                        Icons.menu,
                                        color: theme.colorScheme.onBackground,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    side: BorderSide(color: Colors.red)),
                                child: InkWell(
                                  splashColor: Colors.red,
                                  child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(
                                        Icons.share,
                                        color: theme.colorScheme.onBackground,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
