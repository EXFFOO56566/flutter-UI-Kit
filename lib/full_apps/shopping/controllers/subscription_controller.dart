import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import '../models/subscription.dart';

class SubscriptionController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Subscription>? subscriptions;
  late Subscription subscription;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    subscriptions = await Subscription.getDummyList();
    subscription = subscriptions!.first;
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void selectSubscription(Subscription newSubscription) {
    subscription = newSubscription;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "subscription_controller";
  }
}
