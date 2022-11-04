import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/coin.dart';
import '../nft_cache.dart';
import '../views/single_coin_screen.dart';

class WalletController extends FxController {
  List<String> currencyList = [];
  List<String> balanceList = [];
  List<IconData> balanceIcons = [];
  int selectedCurrencyType = 0;
  int selectedBalanceType = 0;
  List<Coin> coins = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    currencyList = ["USD", "IDR", "SGD"];
    balanceList = ["Top Up", "Withdrawal"];
    balanceIcons = [
      Icons.account_balance_wallet_outlined,
      Icons.swap_horiz_outlined
    ];
  }

  fetchData() async {
    coins = NFTCache.coins!;
    update();
  }

  void selectCurrency(int index) {
    selectedCurrencyType = index;
    update();
  }

  void selectBalance(int index) {
    selectedBalanceType = index;
    update();
  }

  void goToSingleCoinScreen(Coin coin) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => SingleCoinScreen(coin: coin),
      ),
    );
  }

  @override
  String getTag() {
    return "wallet_controller";
  }
}
