import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'course_home_screen.dart';
import 'course_profile_screen.dart';
import 'course_search_screen.dart';
import 'course_tasks_screen.dart';
import 'course_video_screen.dart';

class CourseFullApp extends StatefulWidget {
  @override
  _CourseFullAppState createState() => _CourseFullAppState();
}

class _CourseFullAppState extends State<CourseFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  late CustomTheme customTheme;
  late ThemeData theme;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: FxCard(
                  padding: FxSpacing.vertical(12),
                  shadow: FxShadow(
                      position: FxShadowPosition.top, elevation: 2, alpha: 20),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: theme.colorScheme.primary,
                    tabs: <Widget>[
                      Container(
                        child: (_currentIndex == 0)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.home,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.homeOutline,
                                color: theme.colorScheme.onBackground,
                              ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 24),
                          child: (_currentIndex == 1)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.magnify,
                                      color: theme.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.magnify,
                                  color: theme.colorScheme.onBackground,
                                )),
                      Container(
                          margin: EdgeInsets.only(left: 24),
                          child: (_currentIndex == 2)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.chartTimelineVariant,
                                      color: theme.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.chartTimelineVariant,
                                  color: theme.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 3)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.download,
                                      color: theme.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.downloadOutline,
                                  color: theme.colorScheme.onBackground,
                                )),
                    ],
                  ),
                )),
            floatingActionButton: Hero(
              tag: 'course-video',
              child: Container(
                padding: FxSpacing.all(3),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withAlpha(50),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: null,
                  tooltip: "Video",
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => CourseVideoScreen()));
                  },
                  child: Icon(
                    MdiIcons.play,
                    size: 24,
                    color: theme.colorScheme.onPrimary,
                  ),
                  backgroundColor: theme.colorScheme.primary,
                  elevation: 0,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CourseHomeScreen(),
                CourseSearchScreen(),
                CourseTasksScreen(),
                CourseProfileScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
