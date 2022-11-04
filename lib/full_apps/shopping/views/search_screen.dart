import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/search_controller.dart';
import '../models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;

  late SearchController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.put(SearchController(this));
  }

  Widget _buildSingleProduct(Product product) {
    return FadeTransition(
      opacity: controller.fadeAnimation,
      child: FxContainer(
        onTap: () {
          controller.goToProductScreen(product);
        },
        borderRadiusAll: 4,
        paddingAll: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              paddingAll: 0,
              borderRadiusAll: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Hero(
                    tag: "product_image_" + product.name,
                    child: Image(
                      image: AssetImage(product.image),
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      product.favorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(6),
            Hero(
              tag: "product_" + product.name,
              child: FxText.bodyMedium(
                product.name,
                fontWeight: 600,
              ),
            ),
            FxSpacing.height(2),
            Hero(
              tag: product.name + "_" + product.price.toString(),
              child: FxText.bodyMedium(
                '\$' + product.price.toString(),
                fontWeight: 700,
              ),
            ),
            FxSpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: product.name + "_" + product.rating.toString(),
                  child: FxContainer(
                    borderRadiusAll: 4,
                    padding: FxSpacing.xy(8, 4),
                    color: theme.colorScheme.primary,
                    child: Row(
                      children: [
                        Icon(
                          FeatherIcons.star,
                          color: theme.colorScheme.onPrimary,
                          size: 12,
                        ),
                        FxSpacing.width(6),
                        FxText.bodySmall(
                          product.rating.toString(),
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
                FxContainer.bordered(
                  paddingAll: 2,
                  borderRadiusAll: 6,
                  child: Icon(
                    FeatherIcons.plus,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SearchController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: theme.colorScheme.primary.withAlpha(40))),
            child: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    /* if (controller.uiLoading) {
      return Scaffold(
          body: Padding(
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
        child:
            LoadingEffect.getSearchLoadingScreen(context, theme, theme.colorScheme),
      ));
    } else {*/
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: endDrawer(),
      body: ListView(
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: FxTextStyle.bodyMedium(),
                  cursorColor: theme.colorScheme.primary,
                  decoration: InputDecoration(
                    hintText: "Search your product ...",
                    hintStyle: FxTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: theme.cardTheme.color,
                    prefixIcon: Icon(
                      FeatherIcons.search,
                      size: 16,
                      color: theme.colorScheme.onBackground.withAlpha(150),
                    ),
                    isDense: true,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              FxSpacing.width(20),
              FxContainer(
                paddingAll: 12,
                borderRadiusAll: 4,
                onTap: () {
                  controller.openEndDrawer();
                },
                color: theme.colorScheme.primaryContainer,
                child: Icon(
                  FeatherIcons.sliders,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ),
            ],
          ),
          FxSpacing.height(20),
          GridView.builder(
              padding: FxSpacing.zero,
              shrinkWrap: true,
              itemCount: controller.products!.length,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: controller.findAspectRatio(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _buildSingleProduct(controller.products![index]);
              }),
        ],
      ),
    );
    // }
  }

  Widget endDrawer() {
    return Container(
      margin:
          FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: theme.scaffoldBackgroundColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: FxSpacing.xy(16, 12),
                color: theme.colorScheme.primary,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: FxText(
                          "Filter",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    FxContainer.rounded(
                        onTap: () {
                          controller.closeEndDrawer();
                        },
                        paddingAll: 6,
                        color: theme.colorScheme.onPrimary.withAlpha(80),
                        child: Icon(
                          FeatherIcons.x,
                          size: 12,
                          color: theme.colorScheme.onPrimary,
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: FxSpacing.all(20),
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.bodyMedium(
                          "Type",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        FxText.bodySmall(
                          controller.selectedChoices.length.toString() +
                              " selected",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(16),
                  Container(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _buildType(),
                    ),
                  ),
                  FxSpacing.height(24),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.bodyMedium(
                          "Price Range",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        FxText.bodySmall(
                          "\$" +
                              controller.selectedRange.start
                                  .toInt()
                                  .toString() +
                              " - \$" +
                              controller.selectedRange.end.toInt().toString(),
                          color: theme.colorScheme.primary,
                          fontWeight: 600,
                          letterSpacing: 0.35,
                        )
                      ],
                    ),
                  ),
                  FxSpacing.height(16),
                  Container(
                    child: RangeSlider(
                        activeColor: theme.colorScheme.primary,
                        inactiveColor: theme.colorScheme.primary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: controller.selectedRange,
                        onChanged: (RangeValues newRange) {
                          controller.onChangePriceRange(newRange);
                        }),
                  ),
                ],
              )),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: FxContainer(
                      onTap: () {
                        controller.closeEndDrawer();
                      },
                      color: Colors.transparent,
                      padding: FxSpacing.y(12),
                      child: Center(
                        child: FxText(
                          "Clear",
                          color: theme.colorScheme.primary,
                          fontWeight: 600,
                        ),
                      ),
                    )),
                    Expanded(
                        child: FxContainer.none(
                      onTap: () {
                        controller.closeEndDrawer();
                      },
                      padding: FxSpacing.y(12),
                      child: Center(
                        child: FxText(
                          "Apply",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 600,
                        ),
                      ),
                      color: theme.colorScheme.primary,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildType() {
    List<Widget> choices = [];
    controller.categoryList.forEach((item) {
      bool selected = controller.selectedChoices.contains(item);
      if (selected) {
        choices.add(FxContainer.none(
            color: theme.colorScheme.primary.withAlpha(28),
            bordered: true,
            borderRadiusAll: 20,
            paddingAll: 8,
            border: Border.all(color: theme.colorScheme.primary),
            onTap: () {
              controller.removeChoice(item);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check,
                  size: 14,
                  color: theme.colorScheme.primary,
                ),
                FxSpacing.width(6),
                FxText.bodySmall(
                  item,
                  fontSize: 11,
                  color: theme.colorScheme.primary,
                )
              ],
            )));
      } else {
        choices.add(FxContainer.none(
          color: theme.cardTheme.color,
          borderRadiusAll: 20,
          padding: FxSpacing.xy(12, 8),
          onTap: () {
            controller.addChoice(item);
          },
          child: FxText.bodySmall(
            item,
            color: theme.colorScheme.onBackground,
            fontSize: 11,
          ),
        ));
      }
    });
    return choices;
  }
}
