import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/pricing.dart';

class SubscriptionController extends FxController {
  bool showLoading = true, uiLoading = true;
  int selected = 1;
  List<Pricing>? pricingPlans;
  late Pricing selectedPlan;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    pricingPlans = await Pricing.getDummyList();
    selectedPlan = pricingPlans!.first;
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  void onSelectPlan(Pricing pricing) {
    selectedPlan = pricing;
    update();
  }

  @override
  String getTag() {
    return "subscription_controller";
  }
}
