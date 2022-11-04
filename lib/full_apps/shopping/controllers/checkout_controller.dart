import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/shipping_address.dart';

class Tab {
  String name;
  IconData iconData;

  Tab(this.name, this.iconData);
}

class CheckOutController extends FxController {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numPages = 3;
  int paymentMethodSelected = 1;
  ShippingAddress? addressSelected;
  List<ShippingAddress>? addressList;

  List<Tab> tabs = [];

  initState() {
    super.initState();
    currentPage = 0;
    addressList = ShippingAddress.shipping();
    addressSelected = addressList!.first;
    tabs = [
      Tab('Shipping', Icons.local_shipping_outlined),
      Tab('Payment', Icons.payment),
      Tab('Placed', Icons.check_circle_outline),
    ];
  }

  void goBack() {
    Navigator.pop(context);
  }

  void selectPaymentMethod(int method) {
    paymentMethodSelected = method;
    update();
  }

  void selectShippingAddress(ShippingAddress address) {
    addressSelected = address;
    update();
  }

  nextPage() async {
    if (currentPage == numPages) {
      /*   Navigator.push(
          context, MaterialPageRoute(builder: (context) => FullApp()));*/
    } else {
      await pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  previousPage() async {
    if (currentPage == 0) {
      /*   Navigator.push(
          context, MaterialPageRoute(builder: (context) => FullApp()));*/
    } else {
      await pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  onPageChanged(int page, {bool fromUser = false}) async {
    if (!fromUser) currentPage = page;
    update();
    if (fromUser) {
      await pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    if (pageController.hasClients) pageController.dispose();
    super.dispose();
  }

  @override
  String getTag() {
    return "checkout_controller";
  }
}
