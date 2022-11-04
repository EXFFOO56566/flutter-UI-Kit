import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/single_product_controller.dart';
import '../models/product.dart';

class SingleProductScreen extends StatefulWidget {
  final Product product;

  const SingleProductScreen(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;

  late SingleProductController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller =
        FxControllerStore.put(SingleProductController(this, widget.product));
  }

  Widget _buildProductList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(20));

    for (Product product in controller.products!) {
      if (controller.product == product) continue;
      list.add(FxContainer(
        onTap: () {
          controller.goToSingleProduct(product);
        },
        borderRadiusAll: 8,
        paddingAll: 8,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              paddingAll: 0,
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(product.image),
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.favorite_outline,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(8),
            FxText.labelLarge(
              product.name,
              fontWeight: 600,
            ),
            FxSpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.labelLarge(
                  '\$' + product.price.toString(),
                  fontWeight: 700,
                ),
                FxContainer.bordered(
                  paddingAll: 2,
                  borderRadiusAll: 4,
                  child: Icon(
                    FeatherIcons.plus,
                    size: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
      list.add(FxSpacing.width(20));
    }

    return Row(
      children: list,
    );
  }

  Widget _buildSizeWidget() {
    List<Widget> list = [];

    for (String size in controller.sizes) {
      bool selected = size == controller.selectedSize;
      list.add(
        FxContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.selectSize(size);
          },
          border: Border.all(
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: selected ? theme.colorScheme.primary : null,
          child: Center(
            child: FxText.bodySmall(
              size,
              fontWeight: 600,
              color: selected
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
      );

      list.add(FxSpacing.width(8));
    }

    return Wrap(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleProductController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    /*if (controller.uiLoading) {
      return Scaffold(
          body: Padding(
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
        child:
            LoadingEffect.getProductLoadingScreen(context, theme, theme.colorScheme),
      ));
    } else {*/
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            controller.goBack();
          },
          child: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
            color: theme.colorScheme.onBackground,
          ).autoDirection(),
        ),
        actions: [
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, _) {
              return InkWell(
                onTap: () {
                  controller.isFav
                      ? controller.animationController.reverse()
                      : controller.animationController.forward();
                },
                child: Icon(
                  Icons.favorite,
                  color: controller.colorAnimation.value,
                  size: controller.sizeAnimation.value,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, _) {
              return FxSpacing.width(
                  20 - (controller.sizeAnimation.value! - 24) / 2);
            },
          )
        ],
        title: FxText.titleMedium(
          controller.product.name,
          fontWeight: 600,
        ),
      ),
      body: ListView(
        padding: FxSpacing.fromLTRB(0, 4, 0, 20),
        children: [
          Hero(
            tag: "product_image_" + controller.product.name,
            child: FxContainer(
              margin: FxSpacing.x(20),
              paddingAll: 0,
              borderRadiusAll: 4,
              height: 250,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(controller.product.image),
              ),
            ),
          ),
          FxSpacing.height(20),
          FxContainer(
            margin: FxSpacing.x(20),
            paddingAll: 0,
            borderRadiusAll: 0,
            color: theme.scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "product_" + controller.product.name,
                        child: FxText.titleMedium(
                          controller.product.name,
                          fontWeight: 700,
                        ),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: Hero(
                        tag: controller.product.name +
                            "_" +
                            controller.product.rating.toString(),
                        child: FxContainer(
                          borderRadiusAll: 4,
                          padding: FxSpacing.xy(10, 6),
                          color: theme.colorScheme.primary,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FeatherIcons.star,
                                  color: theme.colorScheme.onPrimary,
                                  size: 14,
                                ),
                                FxSpacing.width(6),
                                FxText.labelLarge(
                                  controller.product.rating.toString(),
                                  fontWeight: 600,
                                  color: theme.colorScheme.onSecondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: controller.product.name +
                      "_" +
                      controller.product.price.toString(),
                  child: FxText.titleMedium(
                    '\$' + controller.product.price.toString(),
                    fontWeight: 600,
                  ),
                ),
                FxSpacing.height(20),
                FxText.bodySmall(
                  controller.product.description.toParagraph(true),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                FxSpacing.height(20),
                FxText.bodyMedium(
                  'Size',
                  fontWeight: 600,
                ),
                FxSpacing.height(8),
                _buildSizeWidget(),
              ],
            ),
          ),
          FxSpacing.height(20),
          Container(
            margin: FxSpacing.x(20),
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: controller.cartController,
                  builder: (BuildContext context, _) {
                    return Stack(
                      children: [
                        FxContainer(
                          child: Icon(
                            FeatherIcons.shoppingBag,
                            color: theme.colorScheme.primary,
                            size: controller.cartAnimation.value,
                          ),
                          color: theme.colorScheme.primaryContainer,
                          paddingAll: controller.paddingAnimation.value,
                        ),
                        controller.addCart
                            ? Positioned(
                                right: 10,
                                top: 8,
                                child: FxContainer.rounded(
                                  child: FxText.bodySmall(
                                    "1",
                                    color: theme.colorScheme.onPrimary,
                                    fontSize: 8,
                                    fontWeight: 700,
                                  ),
                                  color: theme.colorScheme.primary,
                                  paddingAll: 4,
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
                FxSpacing.width(20),
                Expanded(
                  child: FxButton.block(
                    splashColor: theme.colorScheme.onPrimary.withAlpha(40),
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      controller.addCart
                          ? controller.cartController.reverse()
                          : controller.cartController.forward();
                      // controller.goToCheckout();
                    },
                    child: FxText.bodyLarge(
                      'Add to Cart',
                      fontWeight: 600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          Container(
            padding: FxSpacing.x(20),
            child: Row(
              children: [
                FxText.bodyLarge(
                  'Related',
                  letterSpacing: 0,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildProductList(),
          ),
        ],
      ),
    );
    //  }
  }
}
