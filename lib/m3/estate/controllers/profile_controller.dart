import 'package:flutx/flutx.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
