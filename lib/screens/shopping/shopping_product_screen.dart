import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'shopping_cart_screen.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key? key,
      this.heroTag = "heroTag",
      this.image = './assets/images/apps/shopping/product/product-3.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
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
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.titleLarge("Febreze AIR", fontWeight: 600),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 16),
                child: Icon(MdiIcons.heartOutline, size: 22))
          ],
        ),
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 24),
                child: Center(
                  child: Hero(
                    tag: widget.heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.image,
                        width: MediaQuery.of(context).size.width * 0.65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: FxText.titleLarge("Rs. 1,500.00",
                            fontWeight: 600, letterSpacing: 0),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: FxText.bodyMedium(
                            "Febreze AIR (blue edison)",
                            fontWeight: 500,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: FxStarRating(rating: 4.5, spacing: 4, size: 24),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.only(
                            top: 4, bottom: 4, left: 12, right: 12),
                        decoration: BoxDecoration(
                            color: Generator.starColor.withAlpha(32),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: FxText.bodyMedium("4.5 (27)",
                            color: Generator.starColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withAlpha(24),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingCartScreen()));
                      },
                      child: FxText.bodyMedium("BUY NOW",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: FxButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingCartScreen()));
                      },
                      backgroundColor: theme.colorScheme.primary.withAlpha(40),
                      child: FxText.bodyMedium("ADD TO CART",
                          fontWeight: 600,
                          color: theme.colorScheme.primary,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
