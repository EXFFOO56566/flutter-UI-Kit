import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/profile.dart';
import '../views/matched_profile_screen.dart';
import '../views/profile_screen.dart';
import '../views/single_chat_screen.dart';
import '../views/single_profile_screen.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numPages = 10;
  List<Profile>? profiles;

  @override
  initState() {
    super.initState();
    super.save = false;
    fetchData();
  }

  nextPage() async {
    if (currentPage == numPages - 1) {
    } else {
      await pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  void goToMatchedProfileScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MatchedProfileScreen(profiles![currentPage])));
  }

  void goToSingleChatScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleChatScreen(profiles![currentPage])));
  }

  void goToProfileScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  previousPage() async {
    if (currentPage == 1) {
    } else {
      await pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  onPageChanged(int page, {bool fromUser = false}) async {
    if (!fromUser) currentPage = page;
    update();
    if (fromUser) {
      await pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  void goToSingleProfileScreen(Profile profile) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SingleProfileScreen(profile)));
  }

  @override
  void dispose() {
    if (pageController.hasClients) pageController.dispose();
    super.dispose();
  }

  void fetchData() async {
    profiles = await Profile.getDummyList();

    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
