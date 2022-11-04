import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/coin.dart';
import '../nft_cache.dart';
import '../views/single_coin_screen.dart';

class HomeController extends FxController {
  List<Coin> coins = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    coins = NFTCache.coins!;
    update();
  }

  double findAspectRatio() {
    double width = MediaQuery.of(context).size.width;
    return ((width - 72) / 3) / (133);
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
    return "home_controller";
  }
}
