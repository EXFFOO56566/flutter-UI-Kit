/*
* File : Shopping Products Card
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';

class ShoppingCard extends StatefulWidget {
  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
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
        body: ListView(
      padding: FxSpacing.x(16),
      children: <Widget>[
        Container(
            margin: FxSpacing.top(24),
            child: _ProductListWidget(
              name: "Cosmic bang",
              image: Images.squares[0],
              shopName: 'Den cosmics',
              star: 4.5,
              price: 12000,
              buildContext: context,
            )),
        Container(
          margin: FxSpacing.top(16),
          child: _ProductListWidget(
            name: "Colorful sandal",
            image: Images.squares[1],
            shopName: 'Lee Shop',
            star: 3.8,
            price: 14780,
            buildContext: context,
          ),
        ),
        Container(
          margin: FxSpacing.top(16),
          child: _ProductListWidget(
            name: "Yellow cake",
            image: Images.squares[2],
            shopName: 'Agus Bakery',
            buildContext: context,
            star: 4,
            price: 15000,
          ),
        ),
        Container(
          margin: FxSpacing.y(16),
          child: _ProductListWidget(
            name: "Toffees",
            image: Images.squares[3],
            shopName: 'Toffee Bakery',
            buildContext: context,
            star: 5,
            price: 12500,
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
    return FxCard(
      shadow: FxShadow(elevation: 8),
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
          FxSpacing.width(20),
          Expanded(
            child: Container(
              height: 90,
              margin: FxSpacing.left(16),
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
                        Icons.favorite_outline,
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
                      FxSpacing.width(4),
                      FxText.bodyLarge(widget.star.toString(), fontWeight: 700),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.store_outlined,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            size: 20,
                          ),
                          FxSpacing.width(8),
                          FxText.bodyMedium(widget.shopName,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              fontWeight: 500),
                        ],
                      ),
                      FxText.bodyMedium("\$ " + widget.price.toString(),
                          fontWeight: 700),
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
