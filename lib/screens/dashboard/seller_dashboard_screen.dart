/*
* File : Seller Dashboard
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SellerDashboardScreen extends StatefulWidget {
  @override
  _SellerDashboardScreenState createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  List<String> _simpleChoice = [
    "New receipt",
    "Read all",
    "Cancel",
  ];

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
          title: FxText.titleLarge("Seller", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.bodySmall("OVERVIEW",
                      fontWeight: 600, letterSpacing: 0.3),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return _simpleChoice.map((String choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: FxText.bodyMedium(
                            choice,
                            letterSpacing: 0.15,
                            color: theme.colorScheme.onBackground,
                          ),
                        );
                      }).toList();
                    },
                    icon: Icon(
                      MdiIcons.dotsVertical,
                      color: theme.colorScheme.onBackground,
                    ),
                  )
                ],
              ),
            ),
            _SingleOverview(
              title: 'Today',
              sales: 234,
              units: 123,
              profit: 14.545,
            ),
            _SingleOverview(
              title: 'Yesterday',
              sales: 123,
              units: 63,
              profit: -25.2,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.bodySmall("NEW ORDERS",
                      fontWeight: 600, letterSpacing: 0.3),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return _simpleChoice.map((String choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: FxText.bodyMedium(
                            choice,
                            letterSpacing: 0.15,
                            color: theme.colorScheme.onBackground,
                          ),
                        );
                      }).toList();
                    },
                    icon: Icon(
                      MdiIcons.dotsVertical,
                      color: theme.colorScheme.onBackground,
                    ),
                  )
                ],
              ),
            ),
            _SingleOrder(
              name: 'Item - 1',
              image: './assets/images/profile/avatar.jpg',
              code: '#11D224S2SF2',
            ),
            _SingleOrder(
              name: 'Item - 2',
              image: './assets/images/profile/avatar_2.jpg',
              code: '#4AS1A3S6AS8',
            ),
            _SingleOrder(
              name: 'Item - 3',
              image: './assets/images/profile/avatar_3.jpg',
              code: '#S1D221XZX6A',
            ),
            _SingleOrder(
              name: 'Item - 4',
              image: './assets/images/profile/avatar_4.jpg',
              code: '#5SD1D5C1Z2X',
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 24, bottom: 8),
              child: Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary),
                        strokeWidth: 1.5)),
              ),
            )
          ],
        ));
  }
}

class _SingleOverview extends StatelessWidget {
  final String title;
  final int units, sales;
  final double profit;

  const _SingleOverview(
      {Key? key,
      required this.title,
      required this.units,
      required this.sales,
      required this.profit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FxContainer.bordered(
      color: Colors.transparent,
      borderRadiusAll: 8,
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 12),
            child: FxText.bodySmall(title.toUpperCase(),
                letterSpacing: 0.3, fontWeight: 600),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FxText.titleSmall("\$",
                              color:
                                  theme.colorScheme.onBackground.withAlpha(220),
                              letterSpacing: 0.3,
                              fontWeight: 500),
                          FxText.titleLarge(sales.toString(),
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.3,
                              fontWeight: 600)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 2),
                          child: FxText.bodyMedium("Sales",
                              color:
                                  theme.colorScheme.onBackground.withAlpha(240),
                              letterSpacing: 0,
                              fontWeight: 500))
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    profit > 0
                        ? Icon(MdiIcons.arrowUp,
                            size: 18, color: theme.colorScheme.primary)
                        : Icon(MdiIcons.arrowDown,
                            size: 20, color: theme.errorColor),
                    FxText.bodySmall(profit.abs().toStringAsFixed(2),
                        color: profit > 0
                            ? theme.colorScheme.primary
                            : theme.errorColor,
                        fontWeight: 500)
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleLarge(units.toString(),
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 600),
                      Container(
                          margin: EdgeInsets.only(top: 2),
                          child: FxText.bodyMedium("Units",
                              color:
                                  theme.colorScheme.onBackground.withAlpha(240),
                              letterSpacing: 0,
                              fontWeight: 500))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SingleOrder extends StatelessWidget {
  final String? name, code, image;

  const _SingleOrder({Key? key, this.name, this.code, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image!), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(name!, fontWeight: 600, letterSpacing: 0),
                  FxText.bodyMedium(
                    code!,
                    fontWeight: 500,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: theme.errorColor.withAlpha(28), // button color
                    child: InkWell(
                      splashColor: theme.errorColor.withAlpha(100),
                      highlightColor: theme.errorColor.withAlpha(28),
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            MdiIcons.close,
                            color: theme.errorColor,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ClipOval(
                    child: Material(
                      color: theme.colorScheme.primary
                          .withAlpha(28), // button color
                      child: InkWell(
                        splashColor: theme.colorScheme.primary.withAlpha(100),
                        highlightColor: theme.colorScheme.primary.withAlpha(28),
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              MdiIcons.check,
                              color: theme.colorScheme.primary,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
