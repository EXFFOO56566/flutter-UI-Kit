import 'package:flutx/flutx.dart';

import '../models/chat.dart';

class EstateSingleChatController extends FxController {
  bool showLoading = true, uiLoading = true;

  late Chat chat;

  EstateSingleChatController(this.chat);

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
