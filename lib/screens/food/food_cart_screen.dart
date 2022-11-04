import 'package:flutkit/screens/food/food_checkout_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'food_product_screen.dart';

class FoodCartScreen extends StatefulWidget {
  @override
  _FoodCartScreenState createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: FxText.titleMedium("Cart",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: <Widget>[
                  SingleCartItem(
                      image: './assets/images/apps/food/food-7.jpg',
                      name: "Food dish",
                      price: 15.99,
                      qty: 4),
                  SingleCartItem(
                      image: './assets/images/apps/food/food-8.jpg',
                      name: "Shepherd's Pie",
                      price: 19.79,
                      qty: 1),
                  SingleCartItem(
                      image: './assets/images/apps/food/food-9.jpg',
                      name: "Bangers",
                      price: 39.79,
                      qty: 2),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.bodyLarge("Subtotal",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      FxText.bodyLarge("\$ 39.99",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodyLarge("Charges \& Taxes",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodyLarge("\$ 9.00",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.titleMedium("Total",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                        FxText.titleMedium("\$ 49.99",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Center(
              child: FxButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodCheckoutScreen()));
                },
                elevation: 0,
                borderRadiusAll: 4,
                child: FxText.bodySmall("Checkout".toUpperCase(),
                    letterSpacing: 0.4,
                    color: theme.colorScheme.onPrimary,
                    fontWeight: 600),
              ),
            )
          ],
        ));
  }
}

class SingleCartItem extends StatefulWidget {
  final String? image, name;
  final double? price;
  final int qty;

  const SingleCartItem(
      {Key? key, this.image, this.name, this.price, required this.qty})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  late ThemeData theme;
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.qty;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodProductScreen()));
              },
              child: Image(
                image: AssetImage(widget.image!),
                height: 100,
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FxText.bodyLarge(widget.name.toString(),
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.bodyLarge("\$ " + widget.price.toString(),
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.bodySmall(
                      "customize",
                      fontSize: 12,
                      color: theme.colorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                FxText.bodyLarge(qty.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (qty > 1)
                            setState(() {
                              qty--;
                            });
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.minus,
                            size: 18,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            qty++;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.plus,
                            size: 18,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
