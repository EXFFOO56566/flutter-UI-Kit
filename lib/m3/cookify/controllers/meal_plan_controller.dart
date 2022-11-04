import 'package:flutkit/m3/cookify/models/meal_plan.dart';
import 'package:flutkit/m3/cookify/models/date_time.dart';
import 'package:flutx/flutx.dart';

class MealPlanController extends FxController {
  bool showLoading = true, uiLoading = true;
  int selectedDate = 0;
  late List<DateTime> listDateTime;
  late List<MealPlan> listMealPlan;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    listDateTime = DateTime.getList();
    listMealPlan = await MealPlan.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "meal_plan_controller";
  }
}
