import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'category_screen.dart';
import 'models/category.dart';
import 'models/product.dart';
import 'notification_dialog.dart';
import 'single_product_screen.dart';

class GroceryHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryHomeScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryHomeScreenState createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen>
    with SingleTickerProviderStateMixin {
  late List<Category> categories;
  late List<Product> products;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    categories = Category.getList();
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: FxSpacing.fromLTRB(0, 48, 0, 70),
          children: <Widget>[
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.titleLarge("Hi, Den!",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return NotificationDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Icon(
                          FeatherIcons.bell,
                          size: 22,
                          color: theme.colorScheme.onBackground.withAlpha(200),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: FxSpacing.zero,
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                color: customTheme.groceryPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Center(
                              child: FxText.labelSmall(
                                "2",
                                color: customTheme.groceryOnPrimary,
                                fontSize: 9,
                                fontWeight: 500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            FxSpacing.height(8),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: FxText.bodyMedium("What would you buy today?",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  xMuted: true),
            ),
            FxSpacing.height(24),
            getBannerWidget(),
            FxSpacing.height(24),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.titleMedium("Categories",
                      letterSpacing: 0,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600),
                  FxText.bodySmall("See All",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildCategories(),
              ),
            ),
            FxSpacing.height(24),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.titleMedium("Best Selling",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodySmall("See All",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            FxSpacing.height(16),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Column(
                children: buildProducts(),
              ),
            )
          ],
        ));
  }

  Widget getBannerWidget() {
    return FxContainer(
      color: customTheme.groceryPrimary.withAlpha(28),
      padding: FxSpacing.all(24),
      margin: FxSpacing.horizontal(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.bodyLarge("Enjoy the special offer\nup to 60%",
              color: customTheme.groceryPrimary,
              fontWeight: 600,
              letterSpacing: 0),
          FxSpacing.height(8),
          FxText.bodySmall("at 15 - 25 March 2021",
              color: theme.colorScheme.onBackground.withAlpha(100),
              fontWeight: 500,
              letterSpacing: -0.2),
        ],
      ),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (int i = 0; i < categories.length; i++) {
      list.add(getSingleCategory(categories[i]));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget getSingleCategory(Category category) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 80,
        onTap: () {
          Navigator.push(
              widget.rootContext,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      GroceryCategoryScreen(context, category, heroTag)));
        },
        padding: FxSpacing.all(16),
        color: category.color,
        child: Column(
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
            ),
            FxSpacing.height(4),
            FxText.labelSmall(
              category.title,
              color: theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
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
