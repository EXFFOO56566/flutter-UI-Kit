import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'shopping_rating_screen.dart';

class ShoppingPaymentScreen extends StatefulWidget {
  @override
  _ShoppingPaymentScreenState createState() => _ShoppingPaymentScreenState();
}

class _ShoppingPaymentScreenState extends State<ShoppingPaymentScreen> {
  final int _numPages = 3;
  int _currentPage = 0;

  int _selectedMethod = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.onBackground.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Payment", fontWeight: 600),
        ),
        backgroundColor: theme.backgroundColor,
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              height: 200,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: PageController(
                    initialPage: 0, viewportFraction: 0.85, keepPage: false),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 20, right: 8),
                    child: FxContainer(
                      color: theme.colorScheme.primary.withAlpha(28),
                      borderRadiusAll: 4,
                      padding: FxSpacing.x(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FxText.headlineSmall("Visa",
                              fontWeight: 800,
                              color: theme.colorScheme.primary),
                          FxText.titleMedium("3481 4866 4789 9954",
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FxText.bodyMedium("Card holder",
                                      color: theme.colorScheme.primary,
                                      fontWeight: 500),
                                  FxText.bodyLarge("Natalia dyer",
                                      color: theme.colorScheme.primary,
                                      fontWeight: 600),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FxText.bodyMedium("Expire date",
                                        color: theme.colorScheme.primary,
                                        fontWeight: 500),
                                    FxText.bodyLarge("08/26",
                                        color: theme.colorScheme.primary,
                                        fontWeight: 600),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 20, left: 8, right: 8),
                    child: FxContainer(
                      color: theme.colorScheme.primary.withAlpha(28),
                      borderRadiusAll: 4,
                      padding: FxSpacing.x(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FxText.headlineSmall("Mastercard",
                              fontWeight: 800,
                              color: theme.colorScheme.primary),
                          FxText.titleMedium("4879 5846 5478 2363",
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FxText.bodyMedium("Card holder",
                                      color: theme.colorScheme.primary,
                                      fontWeight: 500),
                                  FxText.bodyLarge("Liana Fitzgeraldl",
                                      color: theme.colorScheme.primary,
                                      fontWeight: 600),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FxText.bodyMedium("Expire date",
                                        color: theme.colorScheme.primary,
                                        fontWeight: 500),
                                    FxText.bodyLarge("04/25",
                                        color: theme.colorScheme.primary,
                                        fontWeight: 600),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 20, left: 8),
                    child: FxContainer(
                      color: theme.colorScheme.primary,
                      borderRadiusAll: 4,
                      padding: FxSpacing.left(20),
                      child: Center(
                        child: FxText.titleMedium("ADD CARD",
                            fontWeight: 700,
                            letterSpacing: 0.5,
                            color: theme.colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(16),
                      child: FxText.titleSmall("METHODS",
                          fontWeight: 600,
                          color:
                              theme.colorScheme.onBackground.withAlpha(220))),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 0.3,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('./assets/brand/google.png'),
                          width: 30,
                          height: 30,
                        ),
                        FxSpacing.width(20),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: FxText.titleMedium("G pay", fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 0.3,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Image(
                            image: AssetImage('./assets/brand/paypal.png'),
                            width: 30,
                            height: 30),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child:
                                FxText.titleMedium("Paypal", fontWeight: 600),
                          ),
                        ),
                        Icon(
                          MdiIcons.check,
                          color: theme.colorScheme.onBackground,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 0.3,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: FxText.titleSmall("OTHER",
                          fontWeight: 600,
                          color:
                              theme.colorScheme.onBackground.withAlpha(220))),
                  Container(
                    margin: FxSpacing.x(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 0;
                            });
                          },
                          child: OptionWidget(
                            iconData: MdiIcons.history,
                            text: "On EMI",
                            isSelected: _selectedMethod == 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 1;
                            });
                          },
                          child: OptionWidget(
                            iconData: MdiIcons.bankOutline,
                            text: "Bank",
                            isSelected: _selectedMethod == 1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 2;
                            });
                          },
                          child: OptionWidget(
                            iconData: MdiIcons.cashMarker,
                            text: "COD",
                            isSelected: _selectedMethod == 2,
                          ),
                        ),
                      ],
                    ),
                  )
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingRatingScreen()));
                },
                child: FxText.bodyMedium("PAY WITH SECURE",
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.3),
              ),
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
    ThemeData theme = AppTheme.theme;
    return FxContainer.bordered(
      color: isSelected ? theme.colorScheme.primary : Colors.transparent,
      borderRadiusAll: 4,
      bordered: !isSelected,
      paddingAll: 16,
      width: MediaQuery.of(context).size.width * 0.25,
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
