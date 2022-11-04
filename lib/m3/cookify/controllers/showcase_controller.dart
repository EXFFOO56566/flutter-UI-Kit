import 'package:flutkit/m3/cookify/models/showcase.dart';
import 'package:flutkit/m3/cookify/models/category.dart';
import 'package:flutx/flutx.dart';

class ShowcaseController extends FxController {
  bool showLoading = true, uiLoading = true;
  late List<Showcase> showcases;
  late List<Category> categories;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    showcases = await Showcase.getDummyList();
    categories = Category.getList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "showcase_controller";
  }
}
