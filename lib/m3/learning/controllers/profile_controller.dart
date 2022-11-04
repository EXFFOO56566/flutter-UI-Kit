import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/course.dart';
import '../views/edit_profile_screen.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Course>? courses;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    courses = Course.categoryList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToEditProfile() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(),
      ),
    );
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
