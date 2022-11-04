import 'package:flutkit/m3/cookify/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;
  late User user;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    user = await User.getOne();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
