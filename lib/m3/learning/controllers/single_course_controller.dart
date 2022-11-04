import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/recent_course.dart';

class SingleCourseController extends FxController {
  RecentCourse recentCourse;

  SingleCourseController(this.recentCourse);

  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    this.save = false;
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "single_course_controller";
  }
}
