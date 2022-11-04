import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/category.dart';
import 'models/product.dart';
import 'single_product_screen.dart';

class GroceryCategoryScreen extends StatefulWidget {
  final BuildContext rootContext;
  final Category category;
  final String heroTag;

  const GroceryCategoryScreen(this.rootContext, this.category, this.heroTag);

  @override
  _GroceryCategoryScreenState createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    products = Product.getList();

    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
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
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
          ),
          body: ListView(
            padding: FxSpacing.fromLTRB(24, 0, 24, 0),
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Hero(
                      tag: widget.heroTag,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: widget.category.color,
                        ),
                        padding: FxSpacing.all(20),
                        child: Image.asset(
                          widget.category.image,
                          width: 52,
                          height: 52,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                    FxText.titleMedium(
                      widget.category.title,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                    )
                  ],
                ),
              ),
              FxSpacing.height(24),
              Column(
                children: buildProducts(),
              )
            ],
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
            widget.rootContext,
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
