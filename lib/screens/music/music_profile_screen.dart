import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MusicProfileScreen extends StatefulWidget {
  @override
  _MusicProfileScreenState createState() => _MusicProfileScreenState();
}

class _MusicProfileScreenState extends State<MusicProfileScreen> {
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
        body: ListView(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: AssetImage("./assets/images/profile/avatar_4.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleMedium("Anisha Preece",
                      fontWeight: 700, letterSpacing: 0),
                  FxText.bodySmall("anisha@shopy.com",
                      fontWeight: 500, letterSpacing: 0.3),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Icon(
                    MdiIcons.chevronRight,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 36),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FxContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.mapMarkerOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.bodyMedium("Address", fontWeight: 600))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FxContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.creditCardOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.bodyMedium("Payment", fontWeight: 600))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FxContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.contentPaste,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: FxText.bodyMedium("History", fontWeight: 600),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 36),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.heartOutline,
                        size: 22, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.bodyLarge("Favourite", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 22, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        MdiIcons.bellRingOutline,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child:
                            FxText.bodyLarge("Notifications", fontWeight: 600),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 22, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(MdiIcons.eyeOutline,
                          size: 22, color: theme.colorScheme.onBackground),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.bodyLarge("Appearance", fontWeight: 600),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 22, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(MdiIcons.faceAgent,
                          size: 22, color: theme.colorScheme.onBackground),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.bodyLarge("Help \& Support",
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 22, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
