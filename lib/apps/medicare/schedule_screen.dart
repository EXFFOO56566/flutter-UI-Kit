import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'models/schedule.dart';

class MediCareScheduleScreen extends StatefulWidget {
  const MediCareScheduleScreen({Key? key}) : super(key: key);

  @override
  _MediCareScheduleScreenState createState() => _MediCareScheduleScreenState();
}

class _MediCareScheduleScreenState extends State<MediCareScheduleScreen> {
  List<Schedule> upcomingList = [];
  List<Schedule> completedList = [];
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    upcomingList = Schedule.upComingList();
    completedList = Schedule.completedList();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleEvent(Schedule schedule, {bool old = false}) {
    return FxContainer.bordered(
      paddingAll: 16,
      borderRadiusAll: 16,
      child: Row(
        children: [
          FxContainer(
            width: 56,
            padding: FxSpacing.y(12),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodyMedium(
                    schedule.date.toString(),
                    fontWeight: 700,
                    color: customTheme.medicarePrimary,
                  ),
                  FxText.bodySmall(
                    schedule.month,
                    fontWeight: 600,
                    color: customTheme.medicarePrimary,
                  ),
                ],
              ),
            ),
            borderRadiusAll: 4,
            bordered: true,
            border: Border.all(color: customTheme.medicarePrimary),
            color: old
                ? Colors.transparent
                : customTheme.medicarePrimary.withAlpha(60),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodySmall(
                  schedule.event,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  schedule.time,
                  fontSize: 10,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  schedule.doctorName,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          FxSpacing.width(16),
          FxContainer.rounded(
            paddingAll: 4,
            color: customTheme.card,
            child: Icon(
              old ? Icons.call_outlined : Icons.videocam_outlined,
              size: 16,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildUpcomingList() {
    List<Widget> list = [];

    for (int i = 0; i < upcomingList.length; i++) {
      list.add(_buildSingleEvent(upcomingList[i]));

      if (i + 1 < upcomingList.length) list.add(FxSpacing.height(16));
    }
    return list;
  }

  List<Widget> _buildCompletedList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (int i = 0; i < completedList.length; i++) {
      list.add(_buildSingleEvent(completedList[i], old: true));

      if (i + 1 < completedList.length) list.add(FxSpacing.height(16));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FxText.bodyLarge(
          'My schedule',
          fontWeight: 700,
        ),
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          Icon(
            Icons.more_horiz,
            color: theme.colorScheme.onBackground,
            size: 24,
          ),
          FxSpacing.width(24)
        ],
      ),
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 8, 24, 24),
        children: [
          FxText.titleMedium(
            'Upcoming Events',
            letterSpacing: 0.5,
            fontWeight: 700,
          ),
          FxSpacing.height(16),
          Column(
            children: _buildUpcomingList(),
          ),
          FxSpacing.height(24),
          FxText.titleMedium(
            'Completed Events',
            fontWeight: 700,
            letterSpacing: 0.5,
          ),
          FxSpacing.height(16),
          Column(
            children: _buildCompletedList(),
          ),
        ],
      ),
    );
  }
}
