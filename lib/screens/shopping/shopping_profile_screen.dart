import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutkit/extensions/extensions.dart';

class ShoppingProfileScreen extends StatefulWidget {
  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
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
      padding:
          FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            children: <Widget>[
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("./assets/images/profile/avatar_4.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              FxSpacing.width(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium("Anisha Preece",
                        fontWeight: 700, letterSpacing: 0),
                    FxText.bodySmall("anisha@shopy.com",
                        fontWeight: 600, letterSpacing: 0.3),
                  ],
                ),
              ),
              Container(
                child: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ).autoDirection(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FxContainer.bordered(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.mapMarkerOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.labelMedium("Address", fontWeight: 600))
                    ],
                  ),
                ),
              ),
              FxSpacing.width(20),
              Expanded(
                child: FxContainer.bordered(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.creditCardOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.labelMedium("Payment", fontWeight: 700))
                    ],
                  ),
                ),
              ),
              FxSpacing.width(20),
              Expanded(
                child: FxContainer.bordered(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.contentPaste,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.labelMedium("History", fontWeight: 600))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.heartOutline,
                        size: 22, color: theme.colorScheme.onBackground),
                  ),
                  FxSpacing.width(20),
                  Expanded(
                    child: FxText.bodyLarge("Favourite", fontWeight: 600),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                            size: 22, color: theme.colorScheme.onBackground)
                        .autoDirection(),
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
                    FxSpacing.width(20),
                    Expanded(
                      child: FxText.bodyLarge("Notifications", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
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
                    FxSpacing.width(20),
                    Expanded(
                      child: FxText.bodyLarge("Appearance", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
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
                    FxSpacing.width(20),
                    Expanded(
                      child:
                          FxText.bodyLarge("Help \& Support", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 8),
                child: Center(
                  child: FxText.bodyMedium("More screens are coming soon...",
                      fontWeight: 500),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
