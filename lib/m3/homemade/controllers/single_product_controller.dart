import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/product.dart';
import '../models/product_image.dart';

enum ImageResType { portrait, landscape, mixed }

class SingleProductController extends FxController {
  bool showLoading = true, uiLoading = true;
  ImageResType containerType = ImageResType.landscape;
  late int numPages;

  PageController pageController = PageController(initialPage: 1);
  int currentPage = 1;

  late List<ProductImage> images;
  Product? product;

  @override
  void initState() {
    super.save = false;
    super.initState();

    initData();
  }

  void initData() async {
    images = await ProductImage.getDummyList();
    product = await Product.getOne();
    numPages = images.length;
    for (ProductImage image in images) {
      ImageResType type = getResType(image);
      if (type == ImageResType.portrait) {
        containerType = ImageResType.portrait;
        break;
      }
    }

    if (containerType == ImageResType.portrait) {
      pageController = PageController(
        initialPage: 1,
        viewportFraction: 0.7,
      );
    }
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
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
    pageController.dispose();
    super.dispose();
  }

  getResType(ProductImage image) {
    if (image.height < image.width)
      return ImageResType.landscape;
    else
      return ImageResType.portrait;
  }

  @override
  String getTag() {
    return "single_product_controller";
  }
}
