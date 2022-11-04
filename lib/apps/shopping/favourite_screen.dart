import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingFavouriteScreen extends StatefulWidget {
  const ShoppingFavouriteScreen({Key? key}) : super(key: key);

  @override
  _ShoppingFavouriteScreenState createState() =>
      _ShoppingFavouriteScreenState();
}

class _ShoppingFavouriteScreenState extends State<ShoppingFavouriteScreen>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  late AnimationController _hideFabAnimController;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _scrollController = ScrollController();
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      value: 1, // initially visible
    );

    _scrollController!.addListener(() {
      switch (_scrollController!.position.userScrollDirection) {
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
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
          title: FxText.titleMedium("Orders", fontWeight: 600),
        ),
        floatingActionButton: FadeTransition(
          opacity: _hideFabAnimController,
          child: ScaleTransition(
            scale: _hideFabAnimController,
            child: FloatingActionButton.extended(
              label: FxText("Create List",
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.8),
              onPressed: () {},
              icon: Icon(
                MdiIcons.plus,
                color: theme.colorScheme.onPrimary,
              ),
              backgroundColor: theme.colorScheme.primary,
              splashColor: Colors.white.withAlpha(100),
            ),
          ),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          controller: _scrollController,
          children: <Widget>[
            FxContainer.bordered(
              paddingAll: 16,
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium("List 1",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      FxText.bodySmall(
                        "Remove",
                        letterSpacing: 0,
                        color: theme.colorScheme.primary,
                      )
                    ],
                  ),
                  FxSpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Cup Cake",
                          price: 35.79,
                          image:
                              './assets/images/apps/shopping/product/product-1.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 45.89,
                          image:
                              './assets/images/apps/shopping/product/product-2.jpg'),
                      singleProduct(
                          name: "Biscuit",
                          price: 14.29,
                          image:
                              './assets/images/apps/shopping/product/product-3.jpg')
                    ],
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxContainer.bordered(
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium("List 2",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      FxText.bodySmall(
                        "Remove",
                        color: theme.colorScheme.primary,
                        fontWeight: 500,
                      )
                    ],
                  ),
                  FxSpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Unsought",
                          price: 17.89,
                          image:
                              './assets/images/apps/shopping/product/product-5.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 25.89,
                          image:
                              './assets/images/apps/shopping/product/product-8.jpg'),
                      singleProduct(
                          name: "Biscuit",
                          price: 89.29,
                          image:
                              './assets/images/apps/shopping/product/product-7.jpg'),
                      singleProduct(
                          name: "Toy Car",
                          price: 89.29,
                          image:
                              './assets/images/apps/shopping/product/product-9.jpg'),
                    ],
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxContainer.bordered(
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium("List 3",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      FxText.bodySmall(
                        "Remove",
                        color: theme.colorScheme.primary,
                        fontWeight: 500,
                      )
                    ],
                  ),
                  FxSpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Unsought",
                          price: 17.89,
                          image:
                              './assets/images/apps/shopping/product/product-10.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 25.89,
                          image:
                              './assets/images/apps/shopping/product/product-11.jpg')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleProduct(
      {required String image, required String name, double? price}) {
    List<String> _textIconChoice = ["Remove", "Other"];

    return Container(
      margin: FxSpacing.y(8),
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                image,
                height: 52,
                fit: BoxFit.fill,
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.titleMedium(name, letterSpacing: -0.3, fontWeight: 600),
                FxSpacing.height(4),
                FxText.bodyMedium("\$$price",
                    letterSpacing: -0.3, muted: true, fontWeight: 600),
              ],
            ),
          ),
          Container(
            child: PopupMenuButton(
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context) {
                return _textIconChoice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        FxText.labelMedium(
                          choice,
                        )
                      ],
                    ),
                  );
                }).toList();
              },
              icon: Icon(MdiIcons.dotsVertical,
                  color: theme.colorScheme.onBackground.withAlpha(220)),
              color: customTheme.card,
            ),
          )
        ],
      ),
    );
  }
}
