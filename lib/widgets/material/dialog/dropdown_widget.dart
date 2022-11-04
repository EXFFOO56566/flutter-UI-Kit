import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late List<int> _cartQtyList;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _cartQtyList = [5, 2, 4];
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
          title: FxText.titleMedium("Dropdown", fontWeight: 600),
        ),
        key: _scaffoldKey,
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(left: 24, right: 24, top: 0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  singleCartItem(
                      image:
                          './assets/images/apps/shopping/product/product-5.jpg',
                      price: 39.99,
                      name: 'Seeds',
                      index: 0),
                  singleCartItem(
                      image:
                          './assets/images/apps/shopping/product/product-7.jpg',
                      price: 24.99,
                      name: 'Forbes',
                      index: 1),
                  singleCartItem(
                      image:
                          './assets/images/apps/shopping/product/product-8.jpg',
                      price: 12.99,
                      name: 'Sandals',
                      index: 2),
                ],
              ),
              Divider(
                height: 24,
              ),
              _CardBillWidget(),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: FxButton(
                  elevation: 2,
                  borderRadiusAll: 4,
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: FxText.titleMedium("\$ 449.89",
                              letterSpacing: 0.3,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle),
                        child: Icon(
                          MdiIcons.cartArrowRight,
                          color: theme.colorScheme.onPrimary,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget singleCartItem(
      {required String image,
      required String name,
      double? price,
      required int index}) {
    final GlobalKey _simpleMenuKey = new GlobalKey();
    List<int> _list = new List<int>.generate(5, (i) => i + 1);

    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.width * 0.23,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleMedium(name,
                      color: theme.colorScheme.onBackground, letterSpacing: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: PopupMenuButton(
                            key: _simpleMenuKey,
                            onSelected: (dynamic item) {
                              setState(() {
                                _cartQtyList[index] = item;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return _list.map((int option) {
                                return PopupMenuItem(
                                  value: option,
                                  height: 36,
                                  child: FxText.bodyMedium(option.toString(),
                                      color: theme.colorScheme.onBackground),
                                );
                              }).toList();
                            },
                            color: theme.backgroundColor,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 12, right: 12, top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: customTheme.card,
                                border: Border.all(
                                    color: customTheme.border, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  FxText.bodyLarge(
                                    _cartQtyList[index].toString(),
                                    color: theme.colorScheme.onBackground,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Icon(
                                      MdiIcons.chevronDown,
                                      size: 22,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      FxText.bodyLarge("\$$price",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.titleMedium(
                'Subtotal',
                color: theme.colorScheme.onBackground,
              ),
              FxText.titleMedium(
                "\$ 399.99",
                color: theme.colorScheme.onBackground,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.titleMedium(
                  "Charges",
                  color: theme.colorScheme.onBackground,
                ),
                FxText.titleMedium(
                  "+ \$ 59.59",
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.titleMedium(
                  "Discount",
                  color: theme.colorScheme.onBackground,
                ),
                FxText.titleMedium(
                  "- \$ 9.99",
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
