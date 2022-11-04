import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';
import '../models/recent_exercise.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(HomeController());
  }

  Widget _buildSingleExercise(RecentExercise exercise) {
    return FxContainer(
      onTap: () {
        controller.goToRelaxationScreen();
      },
      margin: FxSpacing.x(10),
      paddingAll: 0,
      borderRadiusAll: 4,
      height: 160,
      width: 140,
      color: exercise.color.withAlpha(40),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            bottom: 8,
            left: 30.cd(-16).toDouble(),
            right: (-16).cd(30).toDouble(),
            child: Image(
              image: AssetImage(exercise.image),
            ),
          ),
          Positioned(
              top: 16,
              left: 16,
              bottom: 0,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.labelMedium(
                    exercise.name,
                    fontWeight: 600,
                    color: theme.colorScheme.onBackground,
                  ),
                  FxText.bodySmall(
                    exercise.duration,
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
          isVisible: false,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          isVisible: false,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: controller.getSplineAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
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
      ));
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          children: [
            Container(
              padding: FxSpacing.x(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodyMedium(
                          'Hello, Nen',
                          muted: true,
                        ),
                        FxSpacing.height(8),
                        FxText.titleMedium(
                          'Choose your exercise',
                          fontWeight: 700,
                          letterSpacing: 0.3,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.width(20),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          FeatherIcons.bell,
                          color: theme.colorScheme.onBackground,
                          size: 20,
                        ),
                        Positioned(
                          top: -4,
                          right: -1,
                          child: FxContainer.rounded(
                            paddingAll: 3,
                            color: customTheme.fitnessPrimary,
                            child: Center(
                                child: FxText.bodySmall(
                              '2',
                              color: customTheme.fitnessOnPrimary,
                              fontSize: 8,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxContainer(
              margin: FxSpacing.x(20),
              padding: FxSpacing.y(6),
              borderRadiusAll: 4,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: theme.colorScheme.onBackground,
                        maxLines: 1,
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintText: "Search exercise...",
                          hintStyle: FxTextStyle.bodySmall(
                              color: theme.colorScheme.onBackground,
                              muted: true),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          isDense: true,
                          fillColor: customTheme.card,
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            size: 20,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                          ),
                        ),
                      ),
                    ),
                    FxSpacing.width(8),
                    Container(
                        padding: FxSpacing.y(4),
                        child: VerticalDivider(
                          thickness: 1,
                          color: customTheme.borderDark,
                        )),
                    FxSpacing.width(8),
                    Icon(
                      FeatherIcons.mic,
                      size: 18,
                      color: theme.colorScheme.onBackground,
                    ),
                    FxSpacing.width(20),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            FxContainer(
                borderRadiusAll: 4,
                onTap: () {
                  controller.goToRelaxationScreen();
                },
                margin: FxSpacing.x(20),
                padding: FxSpacing.xy(20, 16),
                color: customTheme.fitnessPrimary.withAlpha(40),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyMedium(
                            "Time to Meditation",
                            color: customTheme.fitnessPrimary,
                            fontWeight: 600,
                          ),
                          FxText.bodySmall(
                            "30 min",
                            color: customTheme.fitnessPrimary,
                          )
                        ],
                      ),
                    ),
                    FxSpacing.width(20),
                    FxButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {
                        controller.goToRelaxationScreen();
                      },
                      splashColor: customTheme.fitnessOnPrimary.withAlpha(28),
                      backgroundColor: customTheme.fitnessPrimary,
                      child: FxText.labelMedium(
                        "START NOW",
                        color: customTheme.fitnessOnPrimary,
                        fontWeight: 600,
                      ),
                    )
                  ],
                )),
            FxSpacing.height(20),
            Container(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    'Recent Exercise',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FxSpacing.width(10),
                  ...controller.exercises!
                      .map((exercise) => _buildSingleExercise(exercise))
                      .toList(),
                  FxSpacing.width(10),
                ],
              ),
            ),
            FxSpacing.height(20),
            Container(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodyMedium(
                        'Weekly Summary',
                        fontWeight: 700,
                      ),
                      FxSpacing.height(2),
                      FxText.bodySmall(
                        'You\'re doing good, keep it up!',
                        muted: true,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: Language.autoDirection(8),
                        right: Language.autoDirection(null, 6),
                        child: Center(
                          child: FxText.bodySmall(
                            '75%',
                            fontWeight: 700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      CircularProgressIndicator(
                        value: 0.75,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            customTheme.fitnessPrimary),
                        backgroundColor: customTheme.borderDark,
                        strokeWidth: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxContainer(
                height: 200,
                padding: FxSpacing.top(20),
                borderRadiusAll: 4,
                margin: FxSpacing.x(20),
                color: customTheme.cardDark,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            FxText.labelMedium(
                              'Calories',
                              muted: true,
                              fontSize: 10,
                            ),
                            FxSpacing.height(4),
                            FxText.labelMedium(
                              '30.5K',
                              fontWeight: 700,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FxText.labelMedium(
                              'Training',
                              muted: true,
                              fontSize: 10,
                            ),
                            FxSpacing.height(4),
                            FxText.labelMedium(
                              '2h 25m',
                              fontWeight: 700,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FxText.labelMedium(
                              'Avg step',
                              muted: true,
                              fontSize: 10,
                            ),
                            FxSpacing.height(4),
                            FxText.labelMedium(
                              '2145',
                              fontWeight: 700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: _buildSplineAreaChart()),
                  ],
                )),
          ],
        ),
      );
    }
  }
}
