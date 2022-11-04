import 'package:flutkit/m3/estate/models/chat.dart';
import 'package:flutx/flutx.dart';

class SingleChatController extends FxController {
  bool showLoading = true, uiLoading = true;

  late Chat chat;

  SingleChatController(this.chat);

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
    return "single_chat_controller";
  }
}
