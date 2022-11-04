import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/relaxation_controller.dart';

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({Key? key}) : super(key: key);

  @override
  _RelaxationScreenState createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  late RelaxationController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(RelaxationController(this));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RelaxationController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      controller.goBack();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 20,
                    ),
                  ),
                  FxSpacing.height(12),
                  FxText.headlineSmall(
                    'Relaxation',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(16),
                  FxProgressBar(
                    width: MediaQuery.of(context).size.width - 40,
                    activeColor: customTheme.fitnessPrimary,
                    inactiveColor: customTheme.fitnessPrimary.withAlpha(40),
                    progress: (controller.totalCount - controller.count) /
                        controller.totalCount,
                    height: 5,
                  ),
                  FxSpacing.height(40),
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                            child: FxContainer.rounded(
                                width: 200 + (100 - controller.animation.value),
                                height:
                                    200 + (100 - controller.animation.value),
                                color: customTheme.fitnessPrimary.withAlpha(40),
                                child: Container())),
                        Center(
                          child: FxContainer.rounded(
                              width: 200 + controller.animation.value,
                              height: 200 + controller.animation.value,
                              color: customTheme.fitnessPrimary.withAlpha(40),
                              child: Container()),
                        ),
                        Center(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 400),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  child: child, scale: animation);
                            },
                            child: FxText.headlineSmall(
                              controller.positionText,
                              fontWeight: 700,
                              color: customTheme.fitnessPrimary,
                              key: ValueKey<String>(controller.positionText),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(40),
                  Center(
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: FxText.headlineSmall(
                            controller.count.toInt().toString(),
                            fontWeight: 700,
                            key: ValueKey<int>(controller.count.toInt()),
                            color: customTheme.fitnessPrimary,
                          ),
                        ),
                        FxText.bodyMedium(
                          'Seconds left',
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  FxButton.block(
                    onPressed: () {
                      controller.goBack();
                    },
                    backgroundColor: customTheme.fitnessPrimary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: FxText.labelMedium(
                      'Finish Workout',
                      color: customTheme.fitnessOnPrimary,
                      fontWeight: 600,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
