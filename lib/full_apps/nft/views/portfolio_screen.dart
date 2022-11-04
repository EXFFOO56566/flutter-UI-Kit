import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/portfolio_controller.dart';
import '../models/coin.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ThemeData theme;
  late PortfolioController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(PortfolioController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<PortfolioController>(
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
                    titleRow(),
                    FxSpacing.height(32),
                    statistics(),
                    FxSpacing.height(12),
                    Divider(),
                    FxSpacing.height(12),
                    FxText.titleMedium(
                      "My Assets",
                      fontWeight: 700,
                    ),
                    FxSpacing.height(20),
                    assetsView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.titleLarge(
              "\$ 25,587.56",
              fontWeight: 700,
            ),
            FxText.titleSmall(
              "Portfolio balance",
              fontWeight: 600,
              xMuted: true,
            ),
          ],
        ),
        FxContainer.rounded(
            paddingAll: 8,
            color: theme.colorScheme.primaryContainer,
            child: Icon(
              FeatherIcons.arrowUpRight,
              size: 20,
              color: theme.colorScheme.onPrimaryContainer,
            )),
      ],
    );
  }

  Widget statistics() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FxText.bodySmall(
              "Today\'s Results",
              xMuted: true,
              fontWeight: 600,
            ),
            FxText.bodyMedium(
              "\$ 2513.65",
              fontWeight: 700,
            ),
          ],
        ),
        FxSpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FxText.bodySmall(
              "Estimated Profit",
              xMuted: true,
              fontWeight: 600,
            ),
            FxText.bodyMedium(
              "\$ 34.40",
              fontWeight: 700,
            ),
          ],
        ),
        FxSpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FxText.bodySmall(
              "Realized Profit",
              xMuted: true,
              fontWeight: 600,
            ),
            FxText.bodyMedium(
              "\$ 4533.55",
              fontWeight: 700,
            ),
          ],
        ),
      ],
    );
  }

  Widget assetsView() {
    List<Widget> list = [];

    for (int i = 0; i < controller.coins.length; i++) {
      Coin coin = controller.coins[i];
      list.add(
        FxContainer(
          onTap: () {
            controller.goToSingleCoinScreen(coin);
          },
          margin: FxSpacing.bottom(20),
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
                        ? Colors.red
                        : Colors.green,
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: list,
    );
  }
}
