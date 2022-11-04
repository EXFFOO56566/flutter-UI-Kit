import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletPaymentScreen extends StatefulWidget {
  @override
  _WalletPaymentScreenState createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int _selectedOption = 1;

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
          title: FxText.titleMedium("Payment", fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            FxText.bodySmall("RECENT PAYEE",
                fontWeight: 600,
                color: theme.colorScheme.onBackground.withAlpha(220)),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: FxContainer(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                image: AssetImage(
                                    './assets/images/profile/avatar_1.jpg')),
                          ),
                        ),
                        Container(
                            child:
                                FxText.titleSmall("Carlos", fontWeight: 600)),
                        FxText.labelSmall("1874596",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: FxContainer(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                image: AssetImage(
                                    './assets/images/profile/avatar_2.jpg')),
                          ),
                        ),
                        Container(
                            child:
                                FxText.titleSmall("Caprice", fontWeight: 600)),
                        FxText.labelSmall("2589631",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                    child: FxContainer.none(
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                    image: AssetImage(
                                        './assets/images/profile/avatar_3.jpg')),
                              ),
                            ),
                            Container(
                                child: FxText.titleSmall("Jenson",
                                    fontWeight: 700)),
                            FxText.labelSmall("1598746",
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                letterSpacing: 0),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(200),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      FxText.bodyLarge("+5",
                          fontWeight: 700, color: theme.colorScheme.onPrimary)
                    ],
                  ),
                )),
              ],
            ),
            FxSpacing.height(20),
            FxText.bodySmall("SELECT OPTION",
                fontWeight: 700,
                color: theme.colorScheme.onBackground.withAlpha(220)),
            FxSpacing.height(20),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = 0;
                      });
                    },
                    child: OptionWidget(
                      iconData: MdiIcons.bankOutline,
                      text: "Bank",
                      isSelected: _selectedOption == 0,
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = 1;
                      });
                    },
                    child: OptionWidget(
                      iconData: MdiIcons.creditCardOutline,
                      text: "Card",
                      isSelected: _selectedOption == 1,
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = 2;
                      });
                    },
                    child: OptionWidget(
                      iconData: MdiIcons.qrcode,
                      text: "QR",
                      isSelected: _selectedOption == 2,
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = 3;
                      });
                    },
                    child: OptionWidget(
                      iconData: MdiIcons.mapMarkerRadiusOutline,
                      text: "Near By",
                      isSelected: _selectedOption == 3,
                    ),
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            FxContainer(
              padding: EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        MdiIcons.accountOutline,
                        color: theme.colorScheme.onPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        style: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          fillColor: customTheme.card,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  )
                ],
              ),
            ),
            FxContainer(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        MdiIcons.currencyUsd,
                        color: theme.colorScheme.onPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        style: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Amount",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  )
                ],
              ),
            ),
            FxSpacing.height(20),
            FxButton.block(
              onPressed: () {},
              child: FxText.bodyMedium("Press \& Hold to Transfer Money",
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                  letterSpacing: 0.3),
              elevation: 0,
              borderRadiusAll: 4,
            ),
          ],
        ));
  }
}

class OptionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;

  OptionWidget(
      {Key? key,
      required this.iconData,
      required this.text,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FxContainer(
      bordered: !isSelected,
      color: isSelected ? theme.colorScheme.primary : theme.backgroundColor,
      borderRadiusAll: 4,
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: FxText.bodySmall(
              text,
              fontWeight: 600,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
            ),
          )
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
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
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
