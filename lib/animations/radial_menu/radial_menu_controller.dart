import 'package:flutx/flutx.dart';

class RadialMenuController extends FxController {
  bool opened = false;

  void close() {
    opened = false;
    update();
  }

  void open() {
    opened = true;
    update();
  }

  @override
  String getTag() {
    return "radial_menu_controller";
  }
}
