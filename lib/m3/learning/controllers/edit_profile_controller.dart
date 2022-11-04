import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class EditProfileController extends FxController {
  bool showLoading = true, uiLoading = true;

  Gender gender = Gender.male;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void changeGender(Gender gender) {
    this.gender = gender;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "edit_profile_controller";
  }
}

enum Gender { male, female }
