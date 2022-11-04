import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/home_controller.dart';
import '../models/coin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    balance(),
                    FxSpacing.height(20),
                    FxText.titleMedium(
                      "Popular Coins",
                      fontWeight: 700,
                    ),
                    FxSpacing.height(20),
                    coinsGrid(),
                    FxSpacing.height(20),
                    FxText.titleMedium(
                      "Crypto Assets",
                      fontWeight: 700,
                    ),
                    FxSpacing.height(20),
                    transactionList(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget balance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.titleSmall(
              "Balance",
              fontWeight: 600,
            ),
            FxSpacing.height(4),
            FxText.titleLarge(
              "\$ 5,234.50",
              fontWeight: 700,
            ),
            FxText.titleSmall(
              "3.56%",
              color: theme.colorScheme.primary,
              fontWeight: 600,
            ),
          ],
        ),
        FxContainer.roundBordered(
          onTap: () {},
          paddingAll: 8,
          color: theme.scaffoldBackgroundColor,
          child: Icon(
            FeatherIcons.bell,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget coinsGrid() {
    return GridView.builder(
        padding: FxSpacing.zero,
        shrinkWrap: true,
        itemCount: controller.coins.length,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: controller.findAspectRatio(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return singleCoin(controller.coins[index]);
        });
  }

  Widget singleCoin(Coin coin) {
    return FxContainer(
      onTap: () {
        controller.goToSingleCoinScreen(coin);
      },
      paddingAll: 12,
      borderRadiusAll: Constant.containerRadius.xs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 32,
            width: 32,
            image: AssetImage(coin.image),
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            coin.name.toUpperCase(),
            fontWeight: 700,
          ),
          FxSpacing.height(2),
          FxText.bodySmall(
            coin.price.toString(),
            xMuted: true,
            fontSize: 10,
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            coin.priceChange.toString(),
            fontWeight: 600,
            fontSize: 10,
          ),
          FxSpacing.height(2),
          FxText.bodySmall(
            coin.percentChange.toString() + "%",
            fontWeight: 600,
            color: (coin.percentChange.toString().startsWith("-"))
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            fontSize: 10,
          ),
          FxSpacing.height(2),
        ],
      ),
    );
  }

  Widget transactionList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: FxSpacing.zero,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 28,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        Coin coin = controller.coins[index];

        return InkWell(
          onTap: () {
            controller.goToSingleCoinScreen(coin);
          },
          child: Row(
            children: [
              Image(
                height: 32,
                width: 32,
                image: AssetImage(coin.image),
              ),
              FxSpacing.width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodySmall(
                      coin.name.toUpperCase(),
                      fontWeight: 700,
                    ),
                    FxText.bodySmall(
                      coin.date.day.toString() +
                          "-" +
                          coin.date.month.toString() +
                          "-" +
                          coin.date.year.toString(),
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
              FxSpacing.width(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    coin.priceChange.toString(),
                    fontWeight: 600,
                    fontSize: 10,
                  ),
                  FxText.bodySmall(
                    coin.percentChange.toString() + "%",
                    color: (coin.percentChange.toString().startsWith("-"))
                        ? theme.colorScheme.error
                        : theme.colorScheme.primary,
                    fontSize: 10,
                    fontWeight: 600,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: controller.coins.length,
    );
  }
}
