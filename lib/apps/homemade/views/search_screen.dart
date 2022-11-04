import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/search_controller.dart';
import '../models/product.dart';
import 'single_product_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SearchController searchController;

  @override
  void initState() {
    super.initState();
    searchController =
        FxControllerStore.putOrFind<SearchController>(SearchController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleProduct(Product product) {
    return FxCard(
        paddingAll: 0,
        borderRadiusAll: 8,
        clipBehavior: Clip.hardEdge,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingleProductScreen()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  product.url,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  height: 140,
                ),
              ],
            ),
            FxContainer(
              paddingAll: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleSmall(product.name, fontWeight: 500),
                  FxSpacing.height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.bodySmall("Rs. " + product.price.toString(),
                          fontWeight: 700),
                      FxContainer(
                        color: customTheme.homemadeSecondary.withAlpha(36),
                        padding:
                            FxSpacing.symmetric(horizontal: 6, vertical: 4),
                        borderRadiusAll: 4,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FeatherIcons.star,
                              color: customTheme.homemadeSecondary,
                              size: 10,
                            ),
                            FxSpacing.width(4),
                            FxText.bodySmall(product.rating.toString(),
                                fontSize: 10,
                                color: customTheme.homemadeSecondary,
                                fontWeight: 600),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  List<Widget> _buildProductList() {
    List<Widget> list = [];

    for (Product product in searchController.products) {
      list.add(_buildSingleProduct(product));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SearchController>(
        controller: searchController,
        builder: (searchController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (searchController.uiLoading) {
      return Container(
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Scaffold(
        key: searchController.scaffoldKey,
        endDrawer: _endDrawer(),
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 44, 24, 0),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController.searchEditingController,
                    style: FxTextStyle.bodyMedium(),
                    cursorColor: customTheme.homemadePrimary,
                    decoration: InputDecoration(
                      hintText: "Search your product",
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground.withAlpha(150)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: customTheme.card,
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        size: 20,
                        color: theme.colorScheme.onBackground.withAlpha(150),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(right: 16),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                FxSpacing.width(16),
                FxContainer.bordered(
                    onTap: () {
                      searchController.openEndDrawer();
                    },
                    color: customTheme.homemadeSecondary.withAlpha(28),
                    border: Border.all(
                        color: customTheme.homemadeSecondary.withAlpha(120)),
                    borderRadiusAll: 8,
                    paddingAll: 13,
                    child: Icon(
                      FeatherIcons.sliders,
                      color: customTheme.homemadeSecondary,
                      size: 18,
                    )),
              ],
            ),
            Container(
              child: GridView.count(
                padding: FxSpacing.fromLTRB(0, 16, 0, 84),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: searchController
                    .findAspectRatio(MediaQuery.of(context).size.width),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: _buildProductList(),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _endDrawer() {
    return SafeArea(
      child: Container(
        margin: FxSpacing.fromLTRB(16, 16, 16, 80),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: customTheme.card,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            color: customTheme.card,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: FxSpacing.xy(16, 12),
                  color: customTheme.homemadePrimary,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: FxText(
                            "Filter",
                            fontWeight: 700,
                            color: customTheme.homemadeOnPrimary,
                          ),
                        ),
                      ),
                      FxContainer.rounded(
                          onTap: () {
                            searchController.closeEndDrawer();
                          },
                          paddingAll: 6,
                          color: customTheme.homemadeOnPrimary.withAlpha(80),
                          child: Icon(
                            FeatherIcons.x,
                            size: 12,
                            color: customTheme.homemadeOnPrimary,
                          ))
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  padding: FxSpacing.all(16),
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
                            searchController.selectedChoices.length.toString() +
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
                                searchController.selectedRange.start
                                    .toInt()
                                    .toString() +
                                " - \$" +
                                searchController.selectedRange.end
                                    .toInt()
                                    .toString(),
                            color: customTheme.homemadeSecondary,
                            fontWeight: 600,
                            letterSpacing: 0.35,
                          )
                        ],
                      ),
                    ),
                    FxSpacing.height(16),
                    Container(
                      child: RangeSlider(
                          activeColor: customTheme.homemadePrimary,
                          inactiveColor:
                              customTheme.homemadeSecondary.withAlpha(100),
                          max: 10000,
                          min: 0,
                          values: searchController.selectedRange,
                          onChanged: (RangeValues newRange) {
                            searchController.onChangePriceRange(newRange);
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
                          searchController.closeEndDrawer();
                        },
                        padding: FxSpacing.y(12),
                        child: Center(
                          child: FxText(
                            "Clear",
                            color: customTheme.homemadeSecondary,
                            fontWeight: 600,
                          ),
                        ),
                      )),
                      Expanded(
                          child: FxContainer.none(
                        onTap: () {
                          searchController.closeEndDrawer();
                        },
                        padding: FxSpacing.y(12),
                        child: Center(
                          child: FxText(
                            "Apply",
                            color: customTheme.homemadeOnPrimary,
                            fontWeight: 600,
                          ),
                        ),
                        color: customTheme.homemadePrimary,
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildType() {
    List<String> categoryList = [
      "ECom",
      "Automobile",
      "Crimes",
      "Business",
      "Fitness",
      "Astro",
      "Politics",
      "Relationship",
      "Food",
      "Electronics",
      "Health",
      "Tech",
      "Entertainment",
      "World",
      "Sports",
      "Other",
    ];

    List<Widget> choices = [];
    categoryList.forEach((item) {
      bool selected = searchController.selectedChoices.contains(item);
      if (selected) {
        choices.add(FxContainer.none(
            color: customTheme.homemadePrimary.withAlpha(28),
            bordered: true,
            borderRadiusAll: 12,
            paddingAll: 8,
            border: Border.all(color: customTheme.homemadePrimary),
            onTap: () {
              searchController.removeChoice(item);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check,
                  size: 14,
                  color: customTheme.homemadePrimary,
                ),
                FxSpacing.width(6),
                FxText.bodySmall(
                  item,
                  fontSize: 11,
                  color: customTheme.homemadePrimary,
                )
              ],
            )));
      } else {
        choices.add(FxContainer.none(
          color: customTheme.border,
          borderRadiusAll: 12,
          padding: FxSpacing.xy(12, 8),
          onTap: () {
            searchController.addChoice(item);
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
