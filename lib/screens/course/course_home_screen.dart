import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'course_exam_time_screen.dart';
import 'course_notification_screen.dart';
import 'course_subject_screen.dart';
import 'course_video_screen.dart';

class CourseHomeScreen extends StatefulWidget {
  @override
  _CourseHomeScreenState createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: FxText.bodyLarge("Hello, Learner",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
              ),
              Container(
                  child: InkWell(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return CourseNotificationScreen();
                      },
                      fullscreenDialog: true));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      MdiIcons.bellOutline,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: FxText.labelSmall(
                            "2",
                            color: theme.colorScheme.onPrimary,
                            fontSize: 9,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: examWidget(),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 24, 0, 0),
          child: FxText.titleMedium("My Course",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Column(
            children: <Widget>[
              singleMyCourse(
                  title: "How to make tubes and paper crafts",
                  image: './assets/images/apps/course/art.jpg',
                  subtitle: "Arts \& Crafts",
                  progress: 0.4,
                  status: "3 of 9 lessons"),
              Container(
                margin: FxSpacing.top(24),
                child: singleMyCourse(
                    title: "Ardunio Robotics with mBot",
                    image: './assets/images/apps/course/robot.jpg',
                    subtitle: "Robotics",
                    progress: 0.6,
                    status: "5 of 8 lessons"),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 24, 24, 0),
          child: FxText.bodyLarge("Up Next",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: <Widget>[
              singleVideoLecture(
                  subject: "Physics",
                  title: "Chap 1",
                  image: './assets/images/apps/course/subject-2.jpg'),
              singleVideoLecture(
                  subject: "Biology",
                  title: "Lab 1",
                  image: './assets/images/apps/course/biology.jpg'),
              singleVideoLecture(
                  subject: "Physics",
                  title: "Chap 2",
                  image: './assets/images/apps/course/subject-6.jpg'),
              singleVideoLecture(
                  subject: "Chemistry",
                  title: "Lab 2",
                  image: './assets/images/apps/course/subject-2.jpg'),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleVideoLecture(
      {required String subject, required String title, required String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseVideoScreen()));
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              height: (MediaQuery.of(context).size.width - 66) / 2,
              width: (MediaQuery.of(context).size.width - 66) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),
                height: (MediaQuery.of(context).size.width - 74) / 2,
                width: (MediaQuery.of(context).size.width - 74) / 2,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: FxText.bodyMedium(subject,
                        color: Colors.white, fontWeight: 600),
                  ),
                  Container(
                    margin: FxSpacing.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: theme.colorScheme.background,
                              shape: BoxShape.circle),
                          child: Icon(
                            MdiIcons.play,
                            color: theme.colorScheme.onBackground,
                            size: 18,
                          ),
                        ),
                        Container(
                          margin: FxSpacing.only(left: 8),
                          child: FxText.bodyLarge(title,
                              color: theme.colorScheme.background,
                              fontWeight: 600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget examWidget() {
    return FxContainer.bordered(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamTimeScreen()));
      },
      borderRadiusAll: 4,
      padding: FxSpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FxText.titleMedium("Mock Test\n21, July",
                fontWeight: 700, color: theme.colorScheme.onBackground),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.bodyMedium(Generator.getDummyText(8),
                color: theme.colorScheme.onBackground.withAlpha(160),
                height: 1.2),
          ),
          Container(
            margin: FxSpacing.top(16),
            padding: FxSpacing.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(28),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: FxText.bodyMedium("Time Table",
                letterSpacing: 0.3,
                color: theme.colorScheme.primary,
                fontWeight: 600),
          ),
        ],
      ),
    );
  }

  Widget singleMyCourse(
      {required String image,
      required String title,
      required String subtitle,
      required String status,
      required double progress}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),
                height: 60,
                width: 60,
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(subtitle,
                        color: theme.colorScheme.primary.withAlpha(180),
                        fontWeight: 700),
                    FxText.bodyLarge(
                      title,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      fontWeight: 600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: FxText.bodyMedium(
                            status,
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FxProgressBar(
                            progress: progress,
                            height: 4,
                            activeColor: customTheme.colorSuccess,
                            inactiveColor:
                                theme.colorScheme.onBackground.withAlpha(80),
                            width: 56)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
