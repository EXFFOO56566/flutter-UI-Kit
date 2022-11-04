import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controllers/lecture_timetable_controller.dart';

class LectureTimeTableScreen extends StatefulWidget {
  LectureTimeTableScreen({Key? key}) : super(key: key);

  @override
  _LectureTimeTableScreenState createState() => _LectureTimeTableScreenState();
}

class _LectureTimeTableScreenState extends State<LectureTimeTableScreen> {
  late ThemeData theme;
  late LectureTimeTableController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    controller = FxControllerStore.putOrFind(LectureTimeTableController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LectureTimeTableController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
          title: FxText.titleMedium(
            'Time Table',
            fontWeight: 600,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: FxSpacing.nTop(16),
          child: SfCalendar(
            view: CalendarView.schedule,
            controller: controller.calendarController,
            showDatePickerButton: false,
            onViewChanged: controller.onViewChanged,
            dataSource: controller.events,
            minDate: controller.minDate,
            maxDate: controller.maxDate,
            monthViewSettings:
                MonthViewSettings(showAgenda: false, numberOfWeeksInView: 3),
            scheduleViewMonthHeaderBuilder:
                (BuildContext context, ScheduleViewMonthHeaderDetails details) {
              return FxContainer.none(
                margin: FxSpacing.fromLTRB(0, 6, 0, 12),
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image(
                        image: ExactAssetImage(
                            'assets/images/month_background/month_' +
                                details.date.month.toString() +
                                '.png'),
                        fit: BoxFit.cover,
                        width: details.bounds.width,
                        height: details.bounds.height),
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 0,
                      child: Text(
                        details.date.monthName +
                            ' ' +
                            details.date.year.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              );
            },
            todayTextStyle:
                FxTextStyle.bodySmall(color: theme.colorScheme.onPrimary),
            todayHighlightColor: theme.colorScheme.primary,
            timeSlotViewSettings: TimeSlotViewSettings(
              minimumAppointmentDuration: Duration(minutes: 60),
            ),
          ),
        ),
      );
    }
  }
}
