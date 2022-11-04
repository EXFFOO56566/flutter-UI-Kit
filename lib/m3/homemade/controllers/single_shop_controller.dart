import 'package:flutx/flutx.dart';

import '../models/category.dart';

class SingleShopController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Category> categories = [];

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    categories = await Category.getDummyList();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "single_shop_controller";
  }
}
