import 'package:flutkit/m3/estate/views/single_estate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/category.dart';
import '../models/house.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;

  List<Category>? categories;

  List<House>? houses;
  List selectedBedRooms = [];
  List selectedBathRooms = [];
  var selectedRange = RangeValues(200, 800);

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    categories = Category.categoryList();
    houses = await House.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleHouseScreen(House house) {
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => SingleEstateScreen(house)));
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
