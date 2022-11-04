import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletCryptoScreen extends StatefulWidget {
  @override
  _WalletCryptoScreenState createState() => _WalletCryptoScreenState();
}

class _WalletCryptoScreenState extends State<WalletCryptoScreen> {
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
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Crypto", fontWeight: 600),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  MdiIcons.qrcode,
                  color: theme.colorScheme.onBackground,
                  size: 24,
                ))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: FxContainer(
                padding:
                    EdgeInsets.only(top: 36, bottom: 36, right: 40, left: 40),
                color: theme.cardTheme.color,
                borderRadiusAll: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "\$ ",
                              style: FxTextStyle.titleLarge(letterSpacing: 0)),
                          TextSpan(
                              text: "3824",
                              style:
                                  FxTextStyle.headlineSmall(letterSpacing: 0)),
                          TextSpan(
                              text: ".75",
                              style: FxTextStyle.titleLarge(letterSpacing: 0)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FxText.bodySmall(
                          "+ \$ 146.25 (10.25\%) ",
                        ),
                        Icon(
                          MdiIcons.arrowUp,
                          color: theme.colorScheme.primary,
                          size: 18,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 32, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.bodySmall("TODAY RATE", fontWeight: 600),
                  Icon(
                    MdiIcons.refresh,
                    color: theme.colorScheme.onBackground,
                    size: 22,
                  )
                ],
              ),
            ),
            FxContainer.bordered(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              color: Colors.transparent,
              borderRadiusAll: 4,
              child: Column(
                children: <Widget>[
                  _SingleRate(
                    name: 'BTC',
                    rate: 451.14,
                    changes: 12.85,
                  ),
                  _SingleRate(
                    name: 'Ethereum',
                    rate: 148.40,
                    changes: -20.54,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: FxText.bodySmall("ACTIVITY", fontWeight: 600),
            ),
            FxContainer.bordered(
              color: Colors.transparent,
              margin: EdgeInsets.all(20),
              padding: FxSpacing.y(8),
              borderRadiusAll: 4,
              child: Column(
                children: <Widget>[
                  _SingleActivity(
                    title: 'Received Ethereum',
                    subtitle: 'Pending transaction',
                    activity: '+0.3785 BTC',
                    activityColor: theme.colorScheme.primary,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  _SingleActivity(
                    title: 'Received Bitcoin',
                    subtitle: 'Pending transaction',
                    activity: '+0.3785 BTC',
                    activityColor: theme.colorScheme.primary,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  _SingleActivity(
                    title: 'Sent Bitcoin',
                    subtitle: 'To Eliott Myers',
                    activity: '-0.7548 BTC',
                    activityColor: theme.errorColor,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Container(
                    child: Center(
                      child: TextButton(
                          onPressed: () {},
                          child: FxText.bodySmall("VIEW ALL",
                              color: theme.colorScheme.primary,
                              letterSpacing: 0.5,
                              fontWeight: 600)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _SingleActivity extends StatelessWidget {
  final String title, subtitle, activity;
  final Color activityColor;

  const _SingleActivity(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.activity,
      required this.activityColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FxText.bodyLarge(title, fontWeight: 700),
              FxText.bodySmall(subtitle, fontWeight: 400),
            ],
          ),
          FxText.titleSmall(activity,
              fontWeight: 600, color: activityColor, letterSpacing: 0),
        ],
      ),
    );
  }
}

class _SingleRate extends StatelessWidget {
  final String name;
  final double rate, changes;

  const _SingleRate(
      {Key? key, required this.name, required this.rate, required this.changes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(child: FxText.titleMedium(name, fontWeight: 600)),
          FxText.bodyLarge("\$ " + rate.toStringAsFixed(2), fontWeight: 600),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                changes > 0
                    ? Icon(MdiIcons.arrowUp,
                        size: 18, color: theme.colorScheme.primary)
                    : Icon(MdiIcons.arrowDown,
                        size: 18, color: theme.errorColor),
                FxText.bodySmall(changes.abs().toStringAsFixed(2),
                    color: changes > 0
                        ? theme.colorScheme.primary
                        : theme.errorColor,
                    fontWeight: 500)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
