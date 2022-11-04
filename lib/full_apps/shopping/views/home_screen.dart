import 'package:flutkit/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/category.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late ThemeData theme;

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.put(HomeController(this));
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      addCategories();
    });
  }

  Widget _buildSingleCategory(Category category) {
    bool selected = category == controller.selectedCategory;
    bool last = controller.categories!.last == category;
    return FxContainer(
      margin: FxSpacing.right(last ? 0 : 12),
      onTap: () {
        controller.changeSelectedCategory(category);
      },
      borderRadiusAll: 4,
      color: selected ? theme.colorScheme.primaryContainer : null,
      paddingAll: 12,
      child: Image(
        image: AssetImage(category.icon),
        height: 20,
        color: selected
            ? theme.colorScheme.primary
            : theme.colorScheme.onBackground.withAlpha(220),
        width: 20,
      ),
    );
  }

  Widget _buildProductList() {
    List<Widget> list = [];

    for (Product product in controller.products!) {
      list.add(FadeTransition(
        opacity: controller.fadeAnimation,
        child: FxContainer(
          onTap: () {
            controller.goToSingleProduct(product);
          },
          borderRadiusAll: 4,
          paddingAll: 16,
          margin: FxSpacing.bottom(20),
          child: Row(
            children: [
              FxContainer(
                paddingAll: 0,
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Hero(
                  tag: "product_image_" + product.name,
                  child: Image(
                    image: AssetImage(product.image),
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FxSpacing.width(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: "product_" + product.name,
                          child: FxText.bodyMedium(
                            product.name,
                          ),
                        ),
                        Icon(
                          product.favorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                    FxSpacing.height(4),
                    Hero(
                      tag: product.name + "_" + product.price.toString(),
                      child: FxText.labelLarge(
                        '\$' + product.price.toString(),
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: product.name + "_" + product.rating.toString(),
                          child: FxContainer(
                            borderRadiusAll: 2,
                            padding: FxSpacing.xy(8, 4),
                            color: theme.colorScheme.primary,
                            child: Row(
                              children: [
                                Icon(
                                  FeatherIcons.star,
                                  color: theme.colorScheme.onPrimary,
                                  size: 12,
                                ),
                                FxSpacing.width(4),
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
                          paddingAll: 4,
                          borderRadiusAll: 4,
                          child: Icon(
                            FeatherIcons.plus,
                            size: 14,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return Column(
      children: list,
    );
  }

  Future<void> addCategories() async {
    Future ft = Future(() {});
    if (controller.newCategories.length == 0) {
      for (int i = 0; i < controller.categories!.length; i++) {
        ft = ft.then((_) {
          return Future.delayed(Duration(milliseconds: 100), () {
            controller.newCategories
                .add(_buildSingleCategory(controller.categories![i]));
            controller.listKey.currentState!.insertItem(i);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    /* if (controller.uiLoading) {
      return Scaffold(
          body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context, theme, theme.colorScheme),
      ));
    } else {*/
    return WillPopScope(
      onWillPop: () => controller.onWillPop(),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "splash_username",
                  child: FxText.titleLarge(
                    'Hey Nency,',
                    fontWeight: 700,
                  ),
                ),
                RotationTransition(
                  turns: controller.bellAnimation,
                  key: controller.intro.keys[0],
                  child: InkWell(
                    onTap: () {
                      controller.goToNotification();
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          FeatherIcons.bell,
                          color: theme.colorScheme.onBackground,
                          size: 20,
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: FxContainer.rounded(
                            paddingAll: 3,
                            color: theme.colorScheme.primary,
                            child: Center(
                                child: FxText.bodySmall(
                              '2',
                              color: theme.colorScheme.onPrimary,
                              fontSize: 8,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            FxSpacing.height(4),
            FadeTransition(
              opacity: controller.fadeAnimation,
              child: FxText.bodySmall(
                'Begin your shopping !!',
                xMuted: true,
              ),
            ),
            FxSpacing.height(20),
            FadeTransition(
              key: controller.intro.keys[1],
              opacity: controller.fadeAnimation,
              child: FxContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadiusAll: 4,
                onTap: () {
                  controller.goToSubscription();
                },
                color: theme.colorScheme.primaryContainer,
                border: Border.all(color: theme.colorScheme.primaryContainer),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.titleMedium(
                          'Enjoy Upto \n50% Discount',
                          letterSpacing: 0.3,
                          fontWeight: 700,
                          color: theme.colorScheme.primary,
                        ),
                        FxSpacing.height(4),
                        FxButton.small(
                          elevation: 0,
                          padding: FxSpacing.xy(20, 2),
                          borderRadiusAll: 4,
                          backgroundColor: theme.colorScheme.primary,
                          onPressed: () {
                            controller.goToSubscription();
                          },
                          child: FxText.labelLarge(
                            'Subscribe',
                            letterSpacing: 0.3,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    FxContainer(
                      paddingAll: 0,
                      borderRadiusAll: 4,
                      height: 100,
                      width: 150,
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(Images.shoppingBannerPhoto),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            FadeTransition(
              opacity: controller.fadeAnimation,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyLarge(
                      'Top Categories',
                      letterSpacing: 0,
                      fontWeight: 600,
                    ),
                    FxText.bodySmall(
                      'SEE ALL',
                      fontWeight: 700,
                      letterSpacing: 0.3,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            Container(
              key: controller.intro.keys[2],
              height: 50,
              child: AnimatedList(
                  scrollDirection: Axis.horizontal,
                  key: controller.listKey,
                  initialItemCount: controller.newCategories.length,
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                        position: animation.drive(controller.offset),
                        child: controller.newCategories[index]);
                  }),
            ),
            FxSpacing.height(20),
            FadeTransition(
              opacity: controller.fadeAnimation,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyLarge(
                      'New Arrivals',
                      letterSpacing: 0,
                      fontWeight: 600,
                    ),
                    FxText.bodySmall(
                      'VIEW MORE',
                      fontWeight: 700,
                      letterSpacing: 0.3,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _buildProductList(),
            ),
          ],
        ),
      ),
    );
    //}
  }
}
