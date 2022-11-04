import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import 'single_category_screen.dart';

class ShoppingCategoryScreen extends StatefulWidget {
  @override
  _ShoppingCategoryScreenState createState() => _ShoppingCategoryScreenState();
}

class _ShoppingCategoryScreenState extends State<ShoppingCategoryScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: FxText.titleMedium("Category", fontWeight: 600),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          children: <Widget>[
            singleCategory(
                image: './assets/images/apps/shopping/technology.jpg',
                title: "Technology",
                description: '241 Item'),
            FxSpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/lifestyle.jpg',
                title: "Life Style",
                description: '325 Item'),
            FxSpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/fashion.jpg',
                title: "Fashion",
                description: '784 Item'),
            FxSpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/art.jpg',
                title: "Art",
                description: '124 Item'),
          ],
        ));
  }

  Widget singleCategory(
      {required String image, String? title, String? description}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShoppingSingleCategoryScreen()));
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(image),
                  height: 160,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: FxSpacing.xy(16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.bodyLarge(description.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                      FxText.titleMedium(title.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
