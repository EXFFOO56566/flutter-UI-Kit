import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'switch_controller.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late SwitchController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.putOrFind(SwitchController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SwitchController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                child: Icon(
                  FeatherIcons.chevronLeft,
                  color: Colors.white,
                ),
                onTap: () {
                  controller.goBack();
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FxText.bodyLarge("Flare Animation"),
                  Container(
                    height: 200,
                    width: 200,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.onClick();
                      },
                      child: FlareActor(
                          "assets/animations/rive/smiley_switch.flr",
                          snapToEnd: false,
                          animation: controller.status),
                    ),
                  ),
                  FxSpacing.height(20),
                  FxText.bodyLarge("Custom Animation"),
                  FxSpacing.height(80),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.toggleValue
                            ? Colors.greenAccent.shade100
                            : Colors.redAccent.shade100.withOpacity(0.5)),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          top: 3,
                          left: controller.toggleValue ? 48 : 0,
                          right: controller.toggleValue ? 0 : 48,
                          child: InkWell(
                            onTap: controller.toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 200),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  child: child,
                                  turns: animation,
                                );
                              },
                              child: controller.toggleValue
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 32,
                                      key: UniqueKey(),
                                    )
                                  : Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 32,
                                      key: UniqueKey(),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
