import 'package:flutx/flutx.dart';

import '../models/course.dart';
import '../models/mentor.dart';

class ExploreController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Mentor>? mentors;
  List<String> selectedCourses = [];
  List<String> courses = [
    'Science',
    'Language',
    'Design',
    'Programming',
    'Biology',
    'Mathematics',
    'Coding',
    'History',
  ];

  List<Course>? courseList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void onTap(String course) {
    if (!selectedCourses.contains(course)) {
      selectedCourses.add(course);
      print(selectedCourses.toString());
    } else {
      selectedCourses.remove(course);
      print(selectedCourses.toString());
    }
    update();
  }

  fetchData() async {
    courseList = Course.categoryList();
    mentors = await Mentor.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "explore_controller";
  }
}
