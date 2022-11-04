import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/product.dart';
import 'single_product_screen.dart';

class GrocerySearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GrocerySearchScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 48, 24, 70),
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: FxTextField(
                      hintText: "Search",
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        size: 18,
                        color: theme.colorScheme.onBackground.withAlpha(150),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: customTheme.card,
                      hintStyle: FxTextStyle.bodyMedium(),
                      labelStyle: FxTextStyle.bodyMedium(),
                      style: FxTextStyle.bodyMedium(),
                      textCapitalization: TextCapitalization.sentences,
                      labelText: "Search",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      cursorColor: customTheme.groceryPrimary,
                      focusedBorderColor: Colors.transparent,
                    ),
                  ),
                  FxSpacing.width(16),
                  //Space.width(16),
                  FxContainer(
                    color: customTheme.groceryPrimary.withAlpha(32),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Icon(
                        FeatherIcons.sliders,
                        color: customTheme.groceryPrimary,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            FxSpacing.height(24),
            FxText.bodyMedium("Search for Vegetables",
                letterSpacing: 0, fontWeight: 600),
            FxSpacing.height(16),
            Column(
              children: buildProducts(),
            )
          ],
        ));
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
        color: customTheme.card,
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
