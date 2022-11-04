import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_product_controller.dart';
import '../models/product_image.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late SingleProductController singleProductController;

  List<Widget> _buildThumbnails() {
    List<Widget> list = [];

    for (int i = 0; i < singleProductController.images.length; i++) {
      bool selected = singleProductController.currentPage == i;
      list.add(FxCard(
        onTap: () {
          singleProductController.onPageChanged(i, fromUser: true);
        },
        borderRadiusAll: 4,
        bordered: selected,
        border: selected
            ? Border.all(color: customTheme.homemadePrimary, width: 3)
            : null,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.transparent,
        paddingAll: 0,
        margin: FxSpacing.x(8),
        child: Image(
          height: 40,
          width: 40,
          image: AssetImage(singleProductController.images[i].url),
          fit: BoxFit.fill,
        ),
      ));
    }

    return list;
  }

  @override
  void initState() {
    super.initState();
    singleProductController =
        FxControllerStore.putOrFind(SingleProductController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleProductController>(
        controller: singleProductController,
        builder: (singleProductController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (singleProductController.uiLoading) {
      return Scaffold(
        backgroundColor: customTheme.card,
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        backgroundColor: customTheme.card,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: FxText.titleLarge(
            singleProductController.product == null
                ? 'Please Wait for sometime'
                : singleProductController.product!.name,
            fontWeight: 600,
          ),
          backgroundColor: customTheme.card,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                FeatherIcons.chevronLeft,
                size: 20,
                color: theme.colorScheme.onBackground,
              )),
        ),
        body: Column(
          children: [
            FxContainer(
              color: Colors.transparent,
              paddingAll: 0,
              borderRadiusAll: 0,
              clipBehavior: Clip.hardEdge,
              marginAll: 0,
              height: singleProductController.containerType ==
                      ImageResType.landscape
                  ? 200
                  : 350,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                allowImplicitScrolling: true,
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: singleProductController.pageController,
                onPageChanged: (int page) {
                  singleProductController.onPageChanged(page);
                },
                children:
                    singleProductController.images.map((ProductImage image) {
                  return FxContainer(
                    borderRadiusAll: 8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.transparent,
                    paddingAll: 0,
                    margin: FxSpacing.x(singleProductController.containerType ==
                            ImageResType.landscape
                        ? 0
                        : 8),
                    child: Image(
                      image: AssetImage(image.url),
                      fit: singleProductController.containerType ==
                              ImageResType.landscape
                          ? BoxFit.fill
                          : BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildThumbnails(),
              ),
            ),
            FxSpacing.height(24),
            Expanded(
              child: FxContainer(
                paddingAll: 16,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                singleProductController.product!.name,
                                fontWeight: 600,
                                color: theme.colorScheme.onBackground,
                              ),
                              FxSpacing.height(6),
                              Row(
                                children: [
                                  FxStarRating(
                                      rating: singleProductController
                                          .product!.rating,
                                      size: 16,
                                      activeColor:
                                          customTheme.homemadeSecondary,
                                      inactiveColor: theme
                                          .colorScheme.onBackground
                                          .withAlpha(140),
                                      inactiveStarFilled: false,
                                      showInactive: true),
                                  FxSpacing.width(8),
                                  FxText.bodySmall(
                                    singleProductController.product!.rating
                                            .toString() +
                                        "/5",
                                    xMuted: true,
                                  ),
                                  FxSpacing.width(8),
                                  FxText.bodySmall(
                                    "(" +
                                        singleProductController
                                            .product!.ratingCount
                                            .toString() +
                                        " Reviews)",
                                    muted: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FxContainer.rounded(
                            paddingAll: 12,
                            color: customTheme.homemadeSecondary.withAlpha(40),
                            child: Icon(
                              FeatherIcons.heart,
                              size: 16,
                              color: customTheme.homemadeSecondary,
                            ))
                      ],
                    ),
                    FxSpacing.height(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleSmall(
                          "\$ " +
                              singleProductController.product!.price.toString(),
                          fontWeight: 600,
                        ),
                        FxText.titleSmall(
                          "Available stock : " +
                              singleProductController.product!.quantity
                                  .toString(),
                          fontWeight: 600,
                        ),
                      ],
                    ),
                    FxSpacing.height(16),
                    Expanded(
                        child: FxText.bodyMedium(
                      singleProductController.product!.description,
                      color: theme.colorScheme.onBackground,
                    )),
                    FxSpacing.height(16),
                    FxButton.block(
                      elevation: 0,
                      borderRadiusAll: 8,
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EstateFullAppScreen()),
                        );*/
                      },
                      backgroundColor: customTheme.homemadePrimary,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: FxText.labelLarge(
                                  "Add to Cart",
                                  fontWeight: 700,
                                  color: customTheme.estateOnPrimary,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color:
                                  customTheme.homemadeOnPrimary.withAlpha(200),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: FxText.labelLarge(
                                  "\$600",
                                  fontWeight: 700,
                                  color: customTheme.estateOnPrimary,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
