import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class LocationDialogController extends FxController {
  bool showLoading = true, uiLoading = true;
  late TextEditingController searchEditingController;

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    searchEditingController = TextEditingController();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void confirm() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "location_dialog_controller";
  }
}
