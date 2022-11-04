import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'address_screen.dart';
import 'coupon_screen.dart';
import 'order_place_screen.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  int _selectedOption = 1;
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: FxText.titleMedium("Checkout", fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            FxContainer.bordered(
              borderRadiusAll: 4,
              color: Colors.transparent,
              padding: FxSpacing.fromLTRB(20, 32, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          MdiIcons.clockOutline,
                          size: 22,
                          color: theme.colorScheme.primary,
                        ),
                        FxSpacing.width(8),
                        FxText.bodySmall("2-3 Days",
                            fontWeight: 600, muted: true)
                      ],
                    ),
                  ),
                  FxSpacing.height(32),
                  FxText.titleMedium("Toffee Bakery",
                      fontWeight: 600, letterSpacing: 0.3),
                  FxSpacing.height(20),
                  FxContainer(
                    borderRadiusAll: 4,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingAddressScreen()));
                    },
                    paddingAll: 20,
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Image.asset(
                            './assets/other/map-snap.png',
                            height: 64,
                            width: 86,
                            fit: BoxFit.cover,
                          ),
                        ),
                        FxSpacing.width(20),
                        Expanded(
                          child: Container(
                            height: 64,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FxText.titleMedium("West Drive",
                                    fontWeight: 600),
                                FxText.bodySmall(
                                  "14, 921 Section",
                                  xMuted: true,
                                ),
                                FxSpacing.height(4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.informationOutline,
                                      color: FxAppTheme
                                          .theme.colorScheme.onBackground
                                          .withAlpha(200),
                                      size: 10,
                                    ),
                                    FxSpacing.width(4),
                                    FxText.bodySmall(
                                      "Tap to change",
                                      fontSize: 9,
                                      fontWeight: 400,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            FxSpacing.height(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.bodyLarge("Order", fontWeight: 600),
                FxText.bodySmall(
                  " - 2 Item",
                  xMuted: true,
                ),
              ],
            ),
            FxSpacing.height(20),
            FxContainer.bordered(
              borderRadiusAll: 4,
              color: Colors.transparent,
              paddingAll: 20,
              child: Column(
                children: <Widget>[
                  FxContainer.bordered(
                    borderRadiusAll: 4,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FxText.bodyLarge("Yellow Cake",
                              letterSpacing: 0, fontWeight: 600),
                        ),
                        FxText.titleSmall("\$12.99",
                            color: theme.colorScheme.primary, fontWeight: 600)
                      ],
                    ),
                  ),
                  FxSpacing.height(8),
                  FxContainer.bordered(
                    borderRadiusAll: 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FxText.bodyLarge("Colorful Sandal",
                              letterSpacing: 0, fontWeight: 600),
                        ),
                        FxText.titleSmall("\$29.99", fontWeight: 600)
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.bodyMedium(
                                "FLAT40",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600,
                              ),
                              FxText.bodySmall("- 40% at max 100\$",
                                  fontSize: 12,
                                  fontWeight: 400,
                                  letterSpacing: -0.2)
                            ],
                          ),
                          FxButton.text(
                            padding: FxSpacing.zero,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCouponScreen()));
                            },
                            child: FxText.bodyMedium(
                              "Change coupon",
                              letterSpacing: 0,
                              fontWeight: 600,
                              color: theme.colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      FxSpacing.height(8),
                      Container(
                        margin: FxSpacing.top(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FxText.bodyMedium("Charges",
                                muted: true, letterSpacing: 0, fontWeight: 600),
                            FxText.titleSmall("\$ 4.00",
                                letterSpacing: 0, muted: true, fontWeight: 600),
                          ],
                        ),
                      ),
                      FxSpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.bodyLarge("Total",
                              letterSpacing: 0, fontWeight: 700),
                          FxText.bodyLarge("\$ 43.99",
                              letterSpacing: 0, fontWeight: 700),
                        ],
                      ),
                      FxSpacing.height(20),
                      Row(
                        children: <Widget>[
                          FxContainer(
                            paddingAll: 8,
                            borderRadiusAll: 4,
                            child: FxText.bodyMedium("VISA",
                                letterSpacing: 0.4, fontWeight: 900),
                          ),
                          FxSpacing.width(8),
                          FxText.bodySmall(
                            "\u2022\u2022\u2022\u2022  7983",
                            muted: true,
                            letterSpacing: 0,
                            fontWeight: 600,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FxButton.text(
                                padding: FxSpacing.zero,
                                onPressed: () {
                                  paymentMethod(context);
                                },
                                child: FxText.bodyMedium("Change",
                                    letterSpacing: 0,
                                    color: theme.colorScheme.primary,
                                    fontWeight: 600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            FxSpacing.height(24),
            FxButton(
              elevation: 0,
              padding: FxSpacing.y(12),
              borderRadiusAll: 4,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingOrderPlaceScreen()));
              },
              child: FxText.bodySmall(
                "Place Order".toUpperCase(),
                letterSpacing: 0.6,
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
              ),
              backgroundColor: theme.colorScheme.primary,
            )
          ],
        ));
  }

  void paymentMethod(context) {
    showModalBottomSheet(
        backgroundColor: customTheme.card,
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: customTheme.card,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: FxSpacing.xy(24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodySmall(
                      "Select Option".toUpperCase(),
                      fontWeight: 600,
                      muted: true,
                    ),
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
                            child: optionWidget(
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
                            child: optionWidget(
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
                            child: optionWidget(
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
                            child: optionWidget(
                              iconData: MdiIcons.cashMarker,
                              text: "COD",
                              isSelected: _selectedOption == 3,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget optionWidget(
      {IconData? iconData, required String text, required bool isSelected}) {
    return FxCard(
      shadow: FxShadow(darkShadow: true),
      color: isSelected ? theme.colorScheme.primary : Colors.transparent,
      paddingAll: 8,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
            size: 30,
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            text,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
          )
        ],
      ),
    );
  }
}
