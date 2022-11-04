import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CourseTasksScreen extends StatefulWidget {
  @override
  _CourseTasksScreenState createState() => _CourseTasksScreenState();
}

class _CourseTasksScreenState extends State<CourseTasksScreen> {
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
          title: FxText.bodyLarge("Tasks",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: FxSpacing.fromLTRB(24, 0, 0, 0),
                  child: FxText.bodySmall("DUE",
                      fontWeight: 700,
                      muted: true,
                      color: theme.colorScheme.onBackground),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: singleTask(
                    subject: "Biology",
                    statusText: "Over due",
                    submissionDate: "31/07/20",
                    status: 0,
                    task: "Lesson 1",
                  ),
                ),
                singleTask(
                    subject: "Mathematics",
                    task: "Example 2",
                    statusText: "Not submit",
                    status: 1,
                    submissionDate: "22/07/20"),
                singleTask(
                    subject: "History",
                    task: "Example 2",
                    statusText: "Not submit",
                    status: 1,
                    submissionDate: "20/07/20"),
                Container(
                  margin: FxSpacing.fromLTRB(24, 24, 0, 0),
                  child: FxText.bodySmall("IN REVIEW",
                      fontWeight: 700,
                      muted: true,
                      color: theme.colorScheme.onBackground),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: singleTask(
                    subject: "Biology",
                    statusText: "In Review",
                    status: 2,
                    submissionDate: "29/07/20",
                    task: "Lesson 1",
                  ),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 24, 0, 0),
                  child: FxText.bodySmall("SUBMITTED",
                      fontWeight: 700,
                      muted: true,
                      color: theme.colorScheme.onBackground),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: singleTask(
                    subject: "Biology",
                    statusText: "35/40",
                    status: 3,
                    submissionDate: "29/07/20",
                    task: "Lesson 1",
                  ),
                ),
                singleTask(
                  subject: "History",
                  task: "Homework 2",
                  statusText: "27/30",
                  status: 3,
                  submissionDate: "24/07/20",
                ),
              ],
            )
          ],
        ));
  }

  Widget singleTask(
      {String? subject,
      String? task,
      String? submissionDate,
      String? statusText,
      int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    switch (status) {
      case 0:
        iconBG = customTheme.colorError;
        iconColor = customTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customTheme.colorError;
        break;
      case 1:
        iconBG = theme.colorScheme.primary;
        iconColor = theme.colorScheme.onPrimary;
        iconData = MdiIcons.plus;
        statusColor = theme.colorScheme.primary;
        break;
      case 2:
        iconBG = customTheme.colorInfo;
        iconColor = customTheme.onInfo;
        iconData = MdiIcons.pencilOutline;
        statusColor = customTheme.colorInfo;
        break;
      case 3:
        iconBG = customTheme.disabledColor;
        iconColor = customTheme.onDisabled;
        iconData = MdiIcons.spellcheck;
        statusColor = customTheme.disabledColor;
        break;
      default:
        iconBG = customTheme.colorError;
        iconColor = customTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customTheme.colorError;
        break;
    }

    return FxContainer.bordered(
      paddingAll: 16,
      margin: FxSpacing.fromLTRB(24, 8, 24, 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: FxSpacing.all(6),
            decoration: BoxDecoration(color: iconBG, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(subject!,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: FxSpacing.top(2),
                    child: FxText.bodySmall(
                      task!,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                      fontWeight: 600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FxText.bodySmall(submissionDate!,
                  fontSize: 12,
                  letterSpacing: 0.2,
                  color: theme.colorScheme.onBackground,
                  muted: true,
                  fontWeight: 600),
              Container(
                margin: FxSpacing.top(2),
                child: FxText.bodyMedium(statusText!,
                    color: statusColor,
                    letterSpacing: 0,
                    fontWeight: status == 3 ? 600 : 500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
