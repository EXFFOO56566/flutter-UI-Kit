/*
* File : Shopping Home
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'shopping_product_screen.dart';

class ShoppingHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingHomeScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _grocery = false, _cloth = true, _liquor = false, _food = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          EdgeInsets.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
      children: <Widget>[
        FxContainer.bordered(
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _grocery = !_grocery;
                    });
                  },
                  child: _CategoryWidget(
                    iconData: MdiIcons.cartOutline,
                    actionText: "Grocery",
                    isSelected: _grocery,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _cloth = !_cloth;
                    });
                  },
                  child: _CategoryWidget(
                    iconData: MdiIcons.hanger,
                    actionText: "Cloth",
                    isSelected: _cloth,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _liquor = !_liquor;
                    });
                  },
                  child: _CategoryWidget(
                    iconData: MdiIcons.glassWine,
                    actionText: "Liquor",
                    isSelected: _liquor,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _food = !_food;
                    });
                  },
                  child: _CategoryWidget(
                      iconData: MdiIcons.food,
                      isSelected: _food,
                      actionText: "Food"),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: _ProductListWidget(
              name: "Cosmic bang",
              image: './assets/images/apps/shopping/product/product-7.jpg',
              shopName: 'Den cosmics',
              star: 4.5,
              price: 12000,
              buildContext: context,
            )),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Colorful sandal",
            image: './assets/images/apps/shopping/product/product-8.jpg',
            shopName: 'Lee Shop',
            star: 3.8,
            price: 14780,
            buildContext: context,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Yellow cake",
            image: './assets/images/apps/shopping/product/product-1.jpg',
            shopName: 'Agus Bakery',
            buildContext: context,
            star: 4,
            price: 15000,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Toffees",
            image: './assets/images/apps/shopping/product/product-2.jpg',
            shopName: 'Toffee Bakery',
            buildContext: context,
            star: 5,
            price: 12500,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: FxText.titleMedium("Recommended",
              fontWeight: 600, letterSpacing: 0),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Sweet Gems",
            image: './assets/images/apps/shopping/product/product-5.jpg',
            shopName: 'El Primo',
            buildContext: context,
            star: 3,
            price: 14700,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Lipsticks",
            image: './assets/images/apps/shopping/product/product-4.jpg',
            shopName: 'Bee Lipstore',
            buildContext: context,
            star: 4,
            price: 14785,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: _ProductListWidget(
            name: "Candies",
            image: './assets/images/apps/shopping/product/product-3.jpg',
            shopName: 'Bee Lipstore',
            buildContext: context,
            star: 4,
            price: 14785,
          ),
        ),
      ],
    ));
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;
  final BuildContext buildContext;

  const _ProductListWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.shopName,
      required this.star,
      required this.price,
      required this.buildContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.buildContext,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: widget.image,
                    )));
      },
      child: FxContainer(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Hero(
              tag: key,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  widget.image,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            FxSpacing.width(20),
            Expanded(
              child: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.titleMedium(widget.name,
                            fontWeight: 600, letterSpacing: 0),
                        Icon(
                          MdiIcons.heart,
                          color: theme.colorScheme.onBackground.withAlpha(80),
                          size: 22,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FxStarRating(
                            rating: widget.star,
                            size: 20,
                            inactiveColor: theme.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: FxText.bodyLarge(widget.star.toString(),
                              fontWeight: 600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.storeOutline,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: FxText.bodyMedium(widget.shopName,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  fontWeight: 500),
                            )
                          ],
                        ),
                        FxText.bodyMedium("\$ " + widget.price.toString(),
                            fontWeight: 700)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;
  final bool isSelected;

  const _CategoryWidget(
      {Key? key,
      required this.iconData,
      required this.actionText,
      this.isSelected = false})
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
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withAlpha(20),
              child: SizedBox(
                  width: 52,
                  height: 52,
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child:
                FxText.bodySmall(actionText, fontWeight: 600, letterSpacing: 0),
          )
        ],
      ),
    );
  }
}
