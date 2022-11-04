import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/shop.dart';
import '../views/location_dialog.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;

  List<Shop> shops = [];

  late TextEditingController searchEditingController;
  late TextEditingController locationEditingController;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> selectedChoices = [];
  RangeValues selectedRange = RangeValues(200, 800);

  @override
  initState() {
    super.initState();

    getList();
  }

  void getList() async {
    searchEditingController = TextEditingController();
    locationEditingController = TextEditingController();
    await Future.delayed(Duration(seconds: 1));
    shops = await Shop.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeEndDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void addChoice(String item) {
    selectedChoices.add(item);
    update();
  }

  void removeChoice(String item) {
    selectedChoices.remove(item);
    update();
  }

  void onChangePriceRange(RangeValues newRange) {
    selectedRange = newRange;
    update();
  }

  void openLocationDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => LocationDialog());
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
