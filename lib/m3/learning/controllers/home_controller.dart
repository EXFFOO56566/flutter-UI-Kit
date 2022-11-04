import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/course.dart';
import '../models/module.dart';
import '../models/recent_course.dart';
import '../views/subscription_screen.dart';
import '../views/single_course_screen.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Course>? courses;
  List<Module>? modules;
  List<RecentCourse>? recentCourses;
  late Module selectedModule;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void onChangeSingleModule(Module module) {
    selectedModule = module;
    update();
  }

  void goToSingleCourseScreen(RecentCourse recentCourse) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => SingleCourseScreen(recentCourse)));
  }

  void goToPricingScreen() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => SubscriptionScreen()));
  }

  void fetchData() async {
    courses = Course.categoryList();
    recentCourses = await RecentCourse.getDummyList();
    modules = Module.moduleList();
    selectedModule = modules!.first;
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
