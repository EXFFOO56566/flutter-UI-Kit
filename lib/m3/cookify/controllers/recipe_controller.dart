import 'package:flutkit/m3/cookify/models/full_recipe.dart';
import 'package:flutx/flutx.dart';

class RecipeController extends FxController {
  bool showLoading = true, uiLoading = true;
  late FullRecipe recipe;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    recipe = await FullRecipe.getSingle();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "recipe_controller";
  }
}
