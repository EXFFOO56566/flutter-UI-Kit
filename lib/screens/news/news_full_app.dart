import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/custom/navigation/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'news_feed_screen.dart';
import 'news_home_screen.dart';
import 'news_profile_screen.dart';
import 'news_video_screen.dart';

class NewsFullApp extends StatefulWidget {
  @override
  _NewsFullAppState createState() => _NewsFullAppState();
}

class _NewsFullAppState extends State<NewsFullApp> {
  int _currentIndex = 0;
  PageController? _pageController;

  late NavigationTheme navigationTheme;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    navigationTheme = NavigationTheme.getNavigationTheme();
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            NewsHomeScreen(),
            NewsFeedScreen(),
            NewsVideoScreen(),
            NewsProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: navigationTheme.selectedOverlayColor,
        backgroundColor: navigationTheme.backgroundColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
              title: "Home",
              icon: Icon(MdiIcons.homeOutline, size: 22),
              activeIcon: Icon(MdiIcons.home, size: 22),
              activeColor: navigationTheme.selectedItemColor,
              inactiveColor: navigationTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "My Feed",
              icon: Icon(MdiIcons.bookmarkOutline, size: 22),
              activeIcon: Icon(MdiIcons.bookmark, size: 22),
              activeColor: navigationTheme.selectedItemColor,
              inactiveColor: navigationTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Video",
              icon: Icon(MdiIcons.playCircleOutline, size: 22),
              activeIcon: Icon(MdiIcons.playCircle, size: 22),
              activeColor: navigationTheme.selectedItemColor,
              inactiveColor: navigationTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Profile",
              icon: Icon(
                MdiIcons.accountOutline,
                size: 22,
              ),
              activeIcon: Icon(
                MdiIcons.account,
                size: 22,
              ),
              activeColor: navigationTheme.selectedItemColor,
              inactiveColor: navigationTheme.unselectedItemColor),
        ],
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
