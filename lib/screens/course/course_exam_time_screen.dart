import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'course_exam_screen.dart';

class CourseExamTimeScreen extends StatefulWidget {
  @override
  _CourseExamTimeScreenState createState() => _CourseExamTimeScreenState();
}

class _CourseExamTimeScreenState extends State<CourseExamTimeScreen> {
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
      padding: FxSpacing.zero,
      children: <Widget>[
        Container(
          margin: FxSpacing.fromLTRB(24, 44, 24, 0),
          child: Row(
            children: <Widget>[
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: theme.colorScheme.onBackground,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    child: FxText.bodyLarge("Exam",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  MdiIcons.heartOutline,
                  color: theme.colorScheme.onBackground,
                  size: 24,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: <Widget>[
              singleExam(
                  subject: "Biology",
                  date: "Today",
                  place: "Room. 147",
                  teacherImage: './assets/images/profile/avatar_2.jpg',
                  teacherName: "Elliot Haines",
                  time: "9:00 - 13:20",
                  type: "Open Book"),
              Container(
                margin: FxSpacing.top(24),
                child: singleExam(
                    subject: "Science",
                    date: "2 Aug",
                    place: "Lab. 1",
                    teacherImage: './assets/images/profile/avatar_4.jpg',
                    teacherName: "Shane Tierney",
                    time: "12:30 - 15:00",
                    type: "Close Book"),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: singleExam(
                    subject: "Mathematics",
                    date: "5 Aug",
                    place: "Room. 24",
                    teacherImage: './assets/images/profile/avatar_3.jpg',
                    teacherName: "Dustin Wilkerson",
                    time: "8:00 - 11:00",
                    type: "Open Book"),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: singleExam(
                    subject: "English",
                    date: "7 Aug",
                    place: "Announce soon",
                    teacherImage: './assets/images/profile/avatar_1.jpg',
                    teacherName: "Zakaria Navarro",
                    time: "7:45 - 10:00",
                    type: "On Mobile"),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(20),
          child: Column(
            children: <Widget>[
              FxText.bodySmall("If you have any queries about exam",
                  color: theme.colorScheme.onBackground),
              Container(
                margin: FxSpacing.vertical(8),
                child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {},
                    child: FxText.bodySmall("Contact us".toUpperCase(),
                        fontSize: 12,
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary)),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleExam(
      {required String subject,
      required String date,
      required String time,
      required String place,
      required String teacherImage,
      required String teacherName,
      required String type}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamScreen()));
      },
      child: FxContainer.bordered(
        margin: FxSpacing.fromLTRB(24, 0, 24, 0),
        borderRadiusAll: 4,
        paddingAll: 0,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: FxSpacing.fromLTRB(16, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.titleSmall(subject,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        Container(
                          margin: FxSpacing.top(2),
                          child: FxText.bodySmall(date,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0,
                              fontWeight: 600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: FxSpacing.fromLTRB(0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FxText.bodyLarge(place,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        Container(
                          margin: FxSpacing.top(2),
                          child: FxText.bodySmall(time,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0,
                              fontWeight: 600),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
              margin: FxSpacing.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      child: Image(
                        image: AssetImage(teacherImage),
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: FxSpacing.left(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.bodyMedium(teacherName,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodySmall("Examine",
                            fontSize: 12,
                            color: customTheme.colorInfo,
                            fontWeight: 500),
                      ],
                    ),
                  )),
                  Container(
                    child: FxText.bodySmall(type,
                        letterSpacing: 0,
                        color: theme.colorScheme.primary,
                        fontWeight: 500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
