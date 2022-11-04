import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CourseNotificationScreen extends StatefulWidget {
  @override
  _CourseNotificationScreenState createState() =>
      _CourseNotificationScreenState();
}

class _CourseNotificationScreenState extends State<CourseNotificationScreen> {
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
          title: FxText.bodyLarge("Notification",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.notificationClearAll,
                size: 24,
                color: theme.colorScheme.onBackground,
              ),
            ),
            FxSpacing.width(20)
          ],
        ),
        body: ListView(
          padding: FxSpacing.bottom(16),
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                    child: singleAnnouncement(
                        title: "Exam Reading Week",
                        desc: Generator.getDummyText(14),
                        date: "19 - 24 May 2021",
                        time: "-",
                        venue: "At Class"),
                  ),
                  Container(
                    margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                    child: singleAnnouncement(
                        title: "National Science Day",
                        desc: Generator.getDummyText(28),
                        date: "Sunday, 28 Feb 2021",
                        time: "8:00",
                        venue: "At Auditorium"),
                  ),
                  Container(
                    margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                    child: singleAnnouncement(
                        title: "Foundation day",
                        desc: Generator.getDummyText(14),
                        date: "Tuesday, 12 May 2021",
                        time: "10:30",
                        venue: "At Ground"),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget singleAnnouncement(
      {required String title,
      required String date,
      required String time,
      required String venue,
      required String desc}) {
    return FxContainer.bordered(
      padding: FxSpacing.vertical(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: FxSpacing.horizontal(24),
            child: FxText.titleSmall(title,
                color: theme.colorScheme.onBackground, fontWeight: 600),
          ),
          Container(
            padding: FxSpacing.horizontal(24),
            margin: FxSpacing.top(4),
            child: FxText.bodyMedium(desc,
                color: theme.colorScheme.onBackground,
                letterSpacing: 0.3,
                fontWeight: 500,
                height: 1.7),
          ),
          Container(
              margin: FxSpacing.top(16),
              child: Divider(
                height: 0,
              )),
          Container(
            padding: FxSpacing.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.bodyMedium(date, color: theme.colorScheme.primary),
                FxText.bodyMedium(time, color: theme.colorScheme.primary),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(4),
            padding: FxSpacing.horizontal(24),
            child: FxText.bodyMedium(venue,
                color: theme.colorScheme.onBackground.withAlpha(160),
                fontWeight: 500),
          )
        ],
      ),
    );
  }
}
