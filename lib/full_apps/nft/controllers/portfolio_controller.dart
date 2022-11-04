import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/coin.dart';
import '../nft_cache.dart';
import '../views/single_coin_screen.dart';

class PortfolioController extends FxController {
  List<Coin> coins = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    coins = NFTCache.coins!;
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
    return "portfolio_controller";
  }
}
