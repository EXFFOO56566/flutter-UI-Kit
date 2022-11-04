import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoodProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const FoodProfileScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _FoodProfileScreenState createState() => _FoodProfileScreenState();
}

class _FoodProfileScreenState extends State<FoodProfileScreen> {
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
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        FxContainer(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_5.jpg'),
                      width: 64,
                      height: 64,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.bodyLarge("Malia Jackson",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodyMedium("Mal@son.com",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                      ],
                    ),
                  )
                ],
              ),
              FxContainer(
                color: theme.colorScheme.primary,
                margin: EdgeInsets.only(top: 16),
                padding:
                    EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                borderRadiusAll: 4,
                child: Row(
                  children: <Widget>[
                    Icon(MdiIcons.informationOutline,
                        color: theme.colorScheme.onPrimary, size: 18),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.bodyMedium("Gold member",
                          color: Generator.goldColor,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: FxText.bodySmall("Upgrade",
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        FxContainer(
          paddingAll: 16,
          borderRadiusAll: 4,
          margin: FxSpacing.nBottom(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FxText.bodyMedium("Account balance",
                        color: theme.colorScheme.onBackground.withAlpha(220),
                        letterSpacing: 0,
                        fontWeight: 600),
                    FxText.titleSmall("\$ 50.00",
                        color: theme.colorScheme.primary,
                        letterSpacing: 0,
                        fontWeight: 600)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.bodyMedium("Refer Friends",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodySmall("Earn \$100",
                            color: theme.colorScheme.primary, fontWeight: 600)
                      ],
                    ),
                    Icon(
                      MdiIcons.chevronRight,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        FxContainer(
          paddingAll: 20,
          margin: FxSpacing.nBottom(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    MdiIcons.walletOutline,
                    size: 22,
                    color: theme.colorScheme.onBackground,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: FxText.titleSmall("Add money to wallet",
                        color: theme.colorScheme.onBackground.withAlpha(240),
                        letterSpacing: 0,
                        fontWeight: 600),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        MdiIcons.chevronRight,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.mapMarkerOutline,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleSmall("Address setting",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          MdiIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.creditCardOutline,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleSmall("Payment setting",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          MdiIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.faceAgent,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleSmall("Customer support",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          MdiIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.security,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleSmall("Terms",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          MdiIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        FxSpacing.height(20),
        Center(
          child: FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              padding: FxSpacing.x(20),
              onPressed: () {
                Navigator.pop(widget.rootContext);
              },
              child: FxText.bodySmall("Logout".toUpperCase(),
                  letterSpacing: 0.5,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600)),
        )
      ],
    ));
  }
}
