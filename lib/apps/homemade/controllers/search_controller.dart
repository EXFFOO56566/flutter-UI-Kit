import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/product.dart';

class SearchController extends FxController {
  bool showLoading = true, uiLoading = true;
  late TextEditingController searchEditingController;
  late List<Product> products;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> selectedChoices = [];
  RangeValues selectedRange = RangeValues(200, 800);

  @override
  initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    products = await Product.getDummyList();
    searchEditingController = TextEditingController();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return ((width - 64) / 2) / (201);
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

  @override
  String getTag() {
    return "search_controller";
  }
}
