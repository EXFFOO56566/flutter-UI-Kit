import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_shop_controller.dart';
import '../models/category.dart';
import '../models/shop.dart';

class SingleShopScreen extends StatefulWidget {
  final Shop shop;

  const SingleShopScreen(this.shop);

  @override
  _SingleShopScreenState createState() => _SingleShopScreenState();
}

class _SingleShopScreenState extends State<SingleShopScreen> {
  late Shop shop;
  late ThemeData theme;

  late SingleShopController singleShopController;

  @override
  void initState() {
    super.initState();
    singleShopController = FxControllerStore.putOrFind<SingleShopController>(
        SingleShopController());
    theme = AppTheme.homemadeTheme;
    shop = widget.shop;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];

    for (Category category in singleShopController.categories) {
      list.add(_buildSingleCategory(category));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FxContainer.rounded(
          color: theme.colorScheme.primary.withAlpha(40),
          child: Center(
            child: Image(
              height: 24,
              width: 24,
              fit: BoxFit.fill,
              color: theme.colorScheme.primary,
              image: AssetImage(category.url),
            ),
          ),
        ),
        FxSpacing.height(4),
        FxText.bodySmall(
          category.name,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleShopController>(
        controller: singleShopController,
        builder: (singleShopController) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: theme.colorScheme.primary.withAlpha(80))),
            child: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    if (singleShopController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: FxSpacing.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxContainer.bordered(
                    child: Icon(
                      FeatherIcons.chevronLeft,
                      size: 16,
                      color: theme.colorScheme.secondary,
                    ),
                    paddingAll: 10,
                    borderRadiusAll: 6,
                    color: theme.colorScheme.secondary.withAlpha(28),
                    border: Border.all(
                        color: theme.colorScheme.secondary.withAlpha(120)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FxContainer.bordered(
                        child: Icon(
                          FeatherIcons.map,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                      ),
                      FxSpacing.width(16),
                      FxContainer.bordered(
                        child: Icon(
                          FeatherIcons.phoneOutgoing,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                      ),
                      FxSpacing.width(16),
                      FxContainer.bordered(
                        child: Icon(
                          FeatherIcons.moreHorizontal,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            FxContainer(
              margin: FxSpacing.fromLTRB(16, 24, 16, 0),
              clipBehavior: Clip.hardEdge,
              height: 250,
              borderRadiusAll: 8,
              paddingAll: 0,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Image(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(shop.url),
                  ),
                  Positioned(
                      left: 0,
                      top: 16,
                      child: FxContainer(
                        color: theme.colorScheme.primary,
                        padding: FxSpacing.fromLTRB(10, 4, 10, 6),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: FxText.bodySmall(
                          "Open",
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.3,
                        ),
                      ))
                ],
              ),
            ),
            FxContainer(
              margin: FxSpacing.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.titleLarge(
                        shop.name,
                        fontWeight: 600,
                      ),
                      Icon(
                        Icons.favorite_outline_rounded,
                        size: 22,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  FxSpacing.height(4),
                  Row(
                    children: [
                      FxStarRating(
                          rating: shop.ratings,
                          size: 16,
                          activeColor: theme.colorScheme.secondary,
                          inactiveColor:
                              theme.colorScheme.onBackground.withAlpha(140),
                          inactiveStarFilled: false,
                          showInactive: true),
                      FxSpacing.width(4),
                      FxText.bodyMedium(
                        shop.ratings.toString(),
                        xMuted: true,
                      ),
                    ],
                  ),
                  FxSpacing.height(10),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.mapPin,
                        size: 14,
                        color: theme.colorScheme.secondary,
                      ),
                      FxSpacing.width(8),
                      FxText.bodyMedium(
                        shop.location,
                        xMuted: true,
                        letterSpacing: 0.3,
                      ),
                    ],
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxSpacing.width(2),
                      Icon(
                        FeatherIcons.phone,
                        size: 14,
                        color: theme.colorScheme.secondary,
                      ),
                      FxSpacing.width(8),
                      FxText.bodySmall(
                        shop.contact,
                        xMuted: true,
                        letterSpacing: 0.4,
                      ),
                    ],
                  ),
                  FxSpacing.height(10),
                  FxText.bodyMedium(
                    shop.description,
                    textAlign: TextAlign.justify,
                    xMuted: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyLarge(
                    'Categories',
                    fontWeight: 600,
                    fontSize: 18,
                  ),
                  FxSpacing.height(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _buildCategoryList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
