import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'checkout_screen.dart';
import 'models/product.dart';
import 'product_review_screen.dart';

class GrocerySingleProductScreen extends StatefulWidget {
  final String heroKey;
  final Product product;

  const GrocerySingleProductScreen(this.product, this.heroKey);

  @override
  _GrocerySingleProductScreenState createState() =>
      _GrocerySingleProductScreenState();
}

class _GrocerySingleProductScreenState extends State<GrocerySingleProductScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;
  int quantity = 1;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    products = Product.getList();
  }

  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: customTheme.groceryPrimary,
                size: 20,
              ),
            ),
            actions: [
              Icon(
                MdiIcons.heartOutline,
                color: customTheme.groceryPrimary,
                size: 20,
              ),
              FxSpacing.width(16)
            ],
          ),
          body: Container(
            color: customTheme.groceryPrimary.withAlpha(68),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: widget.heroKey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                FxSpacing.height(24),
                FxContainer(
                  padding: FxSpacing.all(24),
                  color: customTheme.card,
                  borderRadiusAll: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FxText.titleMedium(widget.product.name,
                                    fontWeight: 700),
                                FxSpacing.height(8),
                                Row(
                                  children: [
                                    FxText.bodySmall(
                                      "\$3.99",
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    FxSpacing.width(8),
                                    // Space.width(8),
                                    FxText.bodyMedium(
                                      "\$2.32",
                                      fontWeight: 600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          FxContainer(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GroceryProductReviewScreen()));
                            },
                            padding: FxSpacing.fromLTRB(8, 6, 8, 6),
                            color: customTheme.groceryPrimary.withAlpha(40),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FxText.bodyMedium("(243 review)",
                                    color: customTheme.groceryPrimary,
                                    fontWeight: 500,
                                    letterSpacing: -0.2),
                                Icon(
                                  MdiIcons.chevronRight,
                                  size: 14,
                                  color: customTheme.groceryPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      FxSpacing.height(4),
                      FxText.bodySmall(widget.product.description,
                          letterSpacing: 0.4, fontWeight: 500, muted: true),
                      FxSpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FxContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                padding: FxSpacing.all(6),
                                color: customTheme.groceryPrimary.withAlpha(48),
                                child: Icon(
                                  MdiIcons.minus,
                                  size: 14,
                                  color: customTheme.groceryPrimary,
                                ),
                              ),
                              FxSpacing.width(12),
                              FxText.bodyLarge(quantity.toString(),
                                  fontWeight: 600),
                              FxSpacing.width(12),
                              FxContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                padding: FxSpacing.all(6),
                                color: customTheme.groceryPrimary,
                                child: Icon(
                                  MdiIcons.plus,
                                  size: 14,
                                  color: customTheme.groceryOnPrimary,
                                ),
                              ),
                            ],
                          ),
                          FxSpacing.width(24),
                          Expanded(
                              child: FxButton(
                            borderRadiusAll: 4,
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GroceryCheckoutScreen()));
                            },
                            child: FxText.bodyMedium("Buy Now",
                                fontWeight: 600,
                                color: customTheme.groceryOnPrimary),
                            backgroundColor: customTheme.groceryPrimary,
                          ))
                        ],
                      ),
                      FxSpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxText.titleMedium("Related", fontWeight: 600),
                          FxText.bodySmall("See All",
                              fontWeight: 600, xMuted: true, letterSpacing: 0),
                        ],
                      ),
                      FxSpacing.height(16),
                      Column(
                        children: buildProducts(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Widget> buildProducts() {
    List<Widget> list = [];
    for (Product product in products) {
      list.add(getSingleProduct(product));
    }
    return list;
  }

  Widget getSingleProduct(Product product) {
    String heroKey = FxTextUtils.randomString(10);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) =>
                    GrocerySingleProductScreen(product, heroKey)));
      },
      child: FxContainer(
        margin: FxSpacing.bottom(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              color: customTheme.groceryPrimary.withAlpha(32),
              padding: FxSpacing.all(8),
              child: Hero(
                tag: heroKey,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    product.image,
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(product.name,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxSpacing.height(8),
                  FxText.labelSmall(product.description,
                      color: theme.colorScheme.onBackground, muted: true),
                  FxSpacing.height(8),
                  product.discountedPrice != product.price
                      ? Row(
                          children: [
                            FxText.bodySmall(
                                "\$" +
                                    FxTextUtils.doubleToString(product.price),
                                decoration: TextDecoration.lineThrough,
                                fontWeight: 500),
                            // Space.width(8),
                            FxSpacing.width(8),
                            FxText.bodyMedium(
                                "\$" +
                                    FxTextUtils.doubleToString(
                                        product.discountedPrice),
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                          ],
                        )
                      : FxText.bodyMedium(
                          "\$" + FxTextUtils.doubleToString(product.price),
                          color: theme.colorScheme.onBackground,
                          fontWeight: 700),
                ],
              ),
            ),
            // Space.width(8),
            Icon(
              MdiIcons.heartOutline,
              color: customTheme.groceryPrimary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
