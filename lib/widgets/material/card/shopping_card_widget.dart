/*
* File : Shopping Products Card
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingCardWidget extends StatefulWidget {
  @override
  _ShoppingCardWidgetState createState() => _ShoppingCardWidgetState();
}

class _ShoppingCardWidgetState extends State<ShoppingCardWidget> {
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
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Shopping", fontWeight: 600),
        ),
        body: Container(
            child: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 0),
                child: _ProductListWidget(
                  name: "Cosmic bang",
                  image: './assets/images/apps/shopping/product/product-7.jpg',
                  shopName: 'Den cosmics',
                  star: 4.5,
                  price: 12000,
                  buildContext: context,
                )),
            Container(
              margin: EdgeInsets.only(top: 16),
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
              margin: EdgeInsets.only(top: 16),
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
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: _ProductListWidget(
                name: "Toffees",
                image: './assets/images/apps/shopping/product/product-2.jpg',
                shopName: 'Toffee Bakery',
                buildContext: context,
                star: 5,
                price: 12500,
              ),
            ),
          ],
        )));
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
    return FxContainer(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                widget.image,
                height: 90.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium(widget.name,
                          fontWeight: 700, letterSpacing: 0),
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
                          size: 16,
                          inactiveColor: theme.colorScheme.onBackground),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: FxText.bodyLarge(widget.star.toString(),
                            fontWeight: 700),
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
    );
  }
}
