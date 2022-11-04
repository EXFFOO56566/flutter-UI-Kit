import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/schedule_controller.dart';
import '../models/exercise.dart';
import '../models/schedule_exercise.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ScheduleController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ScheduleController());
  }

  Widget _buildDateList() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.dailyExercises!.length; i++) {
      bool selected = controller.currentPage == i;
      tabs.add(Expanded(
        child: InkWell(
          onTap: () {
            controller.selectDate(controller.dailyExercises![i]);
            controller.onPageChanged(i, fromUser: true);
          },
          child: Column(
            children: [
              FxText.labelMedium(
                controller.dailyExercises![i].day,
                xMuted: true,
              ),
              FxSpacing.height(12),
              FxContainer.bordered(
                paddingAll: 6,
                borderRadiusAll: 2,
                border: Border.all(
                    color: selected
                        ? customTheme.fitnessPrimary
                        : customTheme.borderDark),
                color: selected
                    ? customTheme.fitnessPrimary
                    : theme.scaffoldBackgroundColor,
                child: FxText.bodyMedium(
                  controller.dailyExercises![i].date,
                  fontWeight: 600,
                  color: selected
                      ? customTheme.fitnessOnPrimary
                      : theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return FxContainer.bordered(
      borderRadiusAll: 4,
      margin: FxSpacing.x(20),
      padding: FxSpacing.xy(8, 16),
      color: customTheme.cardDark,
      child: Row(
        children: tabs,
      ),
    );
  }

  List<Widget> _buildDailyExercise() {
    List<Widget> list = [];

    for (ScheduleExercise dailyExercise in controller.dailyExercises!) {
      list.add(Padding(
        padding: FxSpacing.x(20),
        child: SingleChildScrollView(
          child: Column(
            children: dailyExercise.exercises.map((exercise) {
              return _buildSingleExercise(exercise);
            }).toList(),
          ),
        ),
      ));
    }

    return list;
  }

  Widget _buildSingleExercise(Exercise exercise) {
    return Padding(
      padding: FxSpacing.bottom(20),
      child: Row(
        children: [
          FxText.bodyMedium(
            exercise.time,
            fontWeight: 600,
          ),
          FxSpacing.width(20),
          Expanded(
            child: exercise.isRest
                ? FxContainer(
                    height: 54,
                    borderRadiusAll: 4,
                    padding: FxSpacing.xy(16, 18),
                    color: customTheme.card,
                    child: FxText.labelMedium(
                      exercise.name,
                    ),
                  )
                : FxContainer(
                    height: 54,
                    borderRadiusAll: 4,
                    padding: FxSpacing.xy(16, 12),
                    color: customTheme.fitnessPrimary.withAlpha(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.labelMedium(
                          exercise.name,
                        ),
                        FxSpacing.height(2),
                        FxText.labelSmall(
                          exercise.duration,
                          muted: true,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ScheduleController>(
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
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: FxText.bodyLarge(
            controller.selectedDate.monthName,
            fontWeight: 600,
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            FxContainer(
              onTap: () {
                controller.showCalendar();
              },
              padding: FxSpacing.x(20),
              color: Colors.transparent,
              child: Icon(
                FeatherIcons.calendar,
                color: theme.colorScheme.onBackground,
                size: 20,
              ),
            )
          ],
        ),
        body: Container(
          padding: FxSpacing.fromLTRB(0, 8, 0, 0),
          child: Column(
            children: [
              _buildDateList(),
              FxSpacing.height(20),
              Container(
                padding: FxSpacing.x(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium(
                      'Daily Exercise',
                      fontWeight: 700,
                    ),
                    Icon(
                      FeatherIcons.moreHorizontal,
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              Expanded(
                child: PageView(
                  allowImplicitScrolling: true,
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (int page) {
                    controller.onPageChanged(page);
                  },
                  children: _buildDailyExercise(),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
