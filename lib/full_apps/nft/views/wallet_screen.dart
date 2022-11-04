import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/wallet_controller.dart';
import '../models/coin.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late ThemeData theme;
  late WalletController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(WalletController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<WalletController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
                child: Column(
                  children: [
                    FxText.bodyMedium(
                      "Current Wallet balance",
                      fontWeight: 600,
                      xMuted: true,
                    ),
                    FxText.titleLarge("\$ 5,234.50", fontWeight: 700),
                    FxSpacing.height(32),
                    currencyView(),
                    FxSpacing.height(20),
                    balanceView(),
                    FxSpacing.height(20),
                    coinsView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget coinsView() {
    List<Widget> list = [];
    for (int i = 0; i < controller.coins.length; i++) {
      Coin coin = controller.coins[i];
      list.add(FxContainer.bordered(
        onTap: () {
          controller.goToSingleCoinScreen(coin);
        },
        paddingAll: 12,
        margin: FxSpacing.bottom(20),
        borderRadiusAll: Constant.containerRadius.small,
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Image(height: 32, width: 32, image: AssetImage(coin.image)),
            FxSpacing.width(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(coin.name + " / " + coin.code),
                  FxSpacing.height(4),
                  FxText.bodyMedium(
                    "\$ " + coin.priceChange.toString(),
                    fontWeight: 700,
                  ),
                ],
              ),
            ),
            FxContainer(
              color: theme.colorScheme.primaryContainer,
              padding: FxSpacing.xy(16, 8),
              borderRadiusAll: Constant.containerRadius.large,
              child: FxText.bodyMedium(
                "Buy",
                fontWeight: 600,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            FxSpacing.width(12),
            FxContainer(
              padding: FxSpacing.xy(16, 8),
              borderRadiusAll: Constant.containerRadius.large,
              child: FxText.bodyMedium(
                "Sell",
                fontWeight: 600,
              ),
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget currencyView() {
    List<Widget> list = [];
    for (int i = 0; i < controller.currencyList.length; i++) {
      bool selected = controller.selectedCurrencyType == i;
      list.add(
        FxContainer(
          color: selected ? theme.colorScheme.primaryContainer : null,
          onTap: () {
            controller.selectCurrency(i);
          },
          borderRadiusAll: Constant.containerRadius.xs,
          padding: FxSpacing.xy(24, 8),
          child: FxText(
            controller.currencyList[i],
            fontWeight: 600,
            color: selected ? theme.colorScheme.onPrimaryContainer : null,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  Widget balanceView() {
    return FxContainer.bordered(
      borderRadiusAll: Constant.containerRadius.small,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.bodySmall(
            "Balance",
            xMuted: true,
            fontWeight: 600,
          ),
          FxText.bodyMedium(
            "\$ 4,556.46",
            fontWeight: 700,
          ),
          FxSpacing.height(16),
          balanceType(),
        ],
      ),
    );
  }

  Widget balanceType() {
    List<Widget> list = [];
    for (int i = 0; i < controller.balanceList.length; i++) {
      bool selected = controller.selectedBalanceType == i;
      list.add(FxContainer.bordered(
        onTap: () {
          controller.selectBalance(i);
        },
        padding: FxSpacing.xy(16, 6),
        margin: FxSpacing.right(16),
        color: selected
            ? theme.colorScheme.primary
            : theme.scaffoldBackgroundColor,
        border: Border.all(
            color: selected ? theme.colorScheme.primary : theme.dividerColor),
        borderRadiusAll: Constant.containerRadius.large,
        child: Row(
          children: [
            Icon(
              controller.balanceIcons[i],
              size: 20,
              color: selected ? theme.colorScheme.onPrimary : null,
            ),
            FxSpacing.width(12),
            FxText.bodySmall(
              controller.balanceList[i],
              fontWeight: 600,
              color: selected ? theme.colorScheme.onPrimary : null,
            ),
          ],
        ),
      ));
    }
    return Row(
      children: list,
    );
  }
}
