import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletHomeScreen extends StatefulWidget {
  @override
  _WalletHomeScreenState createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
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
              MdiIcons.chevronLeft,
            ),
          ),
          title: FxText.titleMedium("Wallet", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Icon(
            MdiIcons.flashOutline,
            size: 26,
          ),
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: <Widget>[
            _CardWidget(),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: FxText.bodySmall("RECENT",
                  fontWeight: 600,
                  color: theme.colorScheme.onBackground.withAlpha(220)),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: ClipOval(
                        child: Material(
                          color: theme.colorScheme.primary,
                          // button color
                          child: InkWell(
                            splashColor: Colors.white,
                            // inkwell color
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(
                                  MdiIcons.plus,
                                  size: 28,
                                  color: theme.colorScheme.onPrimary,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                    _RecentWidget(
                      image: "./assets/images/profile/avatar_4.jpg",
                      name: 'Mark',
                    ),
                    _RecentWidget(
                      image: "./assets/images/profile/avatar.jpg",
                      name: 'Shannan',
                    ),
                    _RecentWidget(
                      image: "./assets/images/profile/avatar_3.jpg",
                      name: 'Talia',
                    ),
                    _RecentWidget(
                      image: "./assets/images/profile/avatar_2.jpg",
                      name: 'Shauna',
                    ),
                    _RecentWidget(
                      image: "./assets/images/profile/avatar_4.jpg",
                      name: 'Paul',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24),
              child: FxText.bodySmall("LAST TRANSACTION",
                  fontWeight: 700,
                  color: theme.colorScheme.onBackground.withAlpha(220)),
            ),
            Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Column(
                  children: <Widget>[
                    _TransactionWidget(
                        name: "Liana Fitzgeraldl",
                        date: "29 may 2020",
                        amount: 177,
                        isSend: false),
                    Divider(
                      height: 0,
                    ),
                    _TransactionWidget(
                        name: "Natalia Dyer",
                        date: "14 dec 2019",
                        amount: 99,
                        isSend: true),
                    Divider(
                      height: 0,
                    ),
                    _TransactionWidget(
                        name: "Talia",
                        date: "6 June 2019",
                        amount: 100,
                        isSend: true),
                    Divider(
                      height: 0,
                    ),
                    _TransactionWidget(
                        name: "Shauna Mark",
                        date: "29 dec 2019",
                        amount: 160,
                        isSend: true),
                    Divider(
                      height: 0,
                    ),
                    _TransactionWidget(
                        name: "Natalia Dyer",
                        date: "2 dec 2019",
                        amount: 19,
                        isSend: true),
                    Divider(
                      height: 0,
                    ),
                    _TransactionWidget(
                        name: "Paul Rip",
                        date: "4 dec 2019",
                        amount: 62,
                        isSend: true),
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 16),
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary),
                              strokeWidth: 1.5)),
                    )
                  ],
                ))
          ],
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
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxText.titleMedium("Quick Action",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.2,
                        fontWeight: 600),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphone,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.subwayVariant,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gasCylinder,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.lightbulbOutline,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.television,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gold,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphoneAndroid,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.googlePlay,
                                      actionText: 'G play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.umbrellaOutline,
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

class _RecentWidget extends StatelessWidget {
  final String image, name;

  _RecentWidget({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          FxText.bodyMedium(name,
              color: theme.colorScheme.onBackground,
              letterSpacing: 0.15,
              height: 1.7)
        ],
      ),
    );
  }
}

class _TransactionWidget extends StatefulWidget {
  final bool isSend;
  final String name, date;
  final int amount;

  _TransactionWidget(
      {Key? key,
      this.isSend = false,
      required this.name,
      required this.date,
      required this.amount})
      : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<_TransactionWidget> {
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
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium(widget.name,
                        fontWeight: 600, letterSpacing: 0),
                    FxText.bodySmall(widget.date, fontWeight: 500),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                FxText.titleMedium(
                  widget.isSend ? "- " : "+ ",
                ),
                FxText.titleMedium("\$ " + widget.amount.toString(),
                    fontWeight: 600),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: PageController(initialPage: 1, viewportFraction: 0.9),
        children: <Widget>[
          FxContainer.bordered(
            margin: EdgeInsets.only(top: 8, bottom: 24, right: 8),
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FxText.headlineSmall("Mastercard",
                    fontWeight: 700, color: Colors.black),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.labelSmall("END BALANCE",
                        fontWeight: 600, color: Colors.black),
                    FxText.titleLarge("\$ 12,000",
                        fontWeight: 700,
                        letterSpacing: 0.3,
                        color: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FxText.bodyMedium("1457 XXXX XXXX 2145",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: Colors.black),
                    FxText.bodyLarge("08/26",
                        fontWeight: 700, color: Colors.black),
                  ],
                )
              ],
            ),
          ),
          FxContainer(
            margin: EdgeInsets.only(left: 8, top: 8, bottom: 24, right: 8),
            color: Color(0xffffe681),
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FxText.headlineSmall("Visa",
                    fontWeight: 700, color: Colors.black),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.labelSmall("END BALANCE",
                        fontWeight: 600, color: Colors.black),
                    FxText.titleLarge("\$ 28,748",
                        fontWeight: 700,
                        letterSpacing: 0.3,
                        color: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FxText.bodyMedium("2486 XXXX XXXX 6842",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: Colors.black),
                    FxText.bodyLarge("07/25",
                        fontWeight: 600, color: Colors.black),
                  ],
                )
              ],
            ),
          ),
          FxContainer(
            margin: EdgeInsets.only(top: 8, bottom: 24, left: 8),
            color: theme.colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MdiIcons.plus,
                      color: theme.colorScheme.onPrimary,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FxText.titleMedium("Add card".toUpperCase(),
                        letterSpacing: 0.8,
                        fontWeight: 700,
                        color: theme.colorScheme.onPrimary),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: theme.colorScheme.primary.withAlpha(16),
              // button color
              child: InkWell(
                splashColor: theme.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: theme.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: FxText.bodySmall(actionText, fontWeight: 700),
          )
        ],
      ),
    );
  }
}
