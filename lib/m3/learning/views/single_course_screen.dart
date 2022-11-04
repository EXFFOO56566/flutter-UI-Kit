import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/single_course_controller.dart';
import '../models/recent_course.dart';

class SingleCourseScreen extends StatefulWidget {
  final RecentCourse recentCourse;

  const SingleCourseScreen(
    this.recentCourse, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleCourseScreenState createState() => _SingleCourseScreenState();
}

class _SingleCourseScreenState extends State<SingleCourseScreen> {
  late ThemeData theme;
  late SingleCourseController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = FxControllerStore.putOrFind(
        SingleCourseController(widget.recentCourse));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleCourseController>(
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
        ),
        body: Padding(
          padding: FxSpacing.nTop(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyLarge(
                      controller.recentCourse.name,
                      fontWeight: 700,
                    ),
                    FxSpacing.height(8),
                    FxText.bodySmall(
                      controller.recentCourse.professor,
                      fontWeight: 600,
                      xMuted: true,
                    ),
                    FxContainer(
                      paddingAll: 20,
                      margin: FxSpacing.y(20),
                      color: theme.colorScheme.primaryContainer,
                      borderRadiusAll: Constant.containerRadius.medium,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(Images.courseBanner),
                          width: 200,
                        ),
                      ),
                    ),
                    FxSpacing.height(8),
                    FxText.bodySmall(
                      controller.recentCourse.description,
                      xMuted: true,
                      height: 1.2,
                    ),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleMedium(
                          'Course Details',
                          fontWeight: 600,
                        ),
                        FxContainer(
                          padding: FxSpacing.xy(20, 8),
                          borderRadiusAll: Constant.containerRadius.medium,
                          border: Border.all(color: theme.colorScheme.primary),
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.clock,
                                size: 20,
                                color: theme.colorScheme.primary,
                              ),
                              FxSpacing.width(8),
                              FxText.bodySmall(
                                controller.recentCourse.time,
                                fontWeight: 600,
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FxSpacing.height(20),
                    Row(
                      children: [
                        Expanded(
                          child: FxContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                FxText.displaySmall(
                                  controller.recentCourse.chapter.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                FxSpacing.height(4),
                                FxText.bodySmall(
                                  'Chapters',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                        FxSpacing.width(20),
                        Expanded(
                          child: FxContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                FxText.displaySmall(
                                  controller.recentCourse.exam.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                FxSpacing.height(4),
                                FxText.bodySmall(
                                  'Exams',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                        FxSpacing.width(20),
                        Expanded(
                          child: FxContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                FxText.displaySmall(
                                  controller.recentCourse.reward.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                FxSpacing.height(4),
                                FxText.bodySmall(
                                  'Rewards',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxButton.block(
                borderRadiusAll: Constant.buttonRadius.large,
                splashColor: theme.colorScheme.onPrimary.withAlpha(20),
                elevation: 0,
                backgroundColor: theme.colorScheme.primary,
                onPressed: () {},
                child: FxText.bodyLarge(
                  'Start Course',
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
