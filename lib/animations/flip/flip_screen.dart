import 'dart:math';

import 'package:flutkit/animations/flip/flip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../../theme/app_theme.dart';

class FlipScreen extends StatefulWidget {
  const FlipScreen({Key? key}) : super(key: key);

  @override
  _FlipScreenState createState() => _FlipScreenState();
}

class _FlipScreenState extends State<FlipScreen> with TickerProviderStateMixin {
  late ThemeData theme;
  late FlipController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    controller = FxControllerStore.put(FlipController(this));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FlipController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    controller.goBack();
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                  ),
                ),
                elevation: 0,
                title: FxText.titleMedium('Flip Animation'),
              ),
              body: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Center(
                      child: InkWell(
                        onTap: () {
                          controller.animationController.repeat();
                        },
                        child: SizedBox(
                          height: 200.0,
                          width: 200.0,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.005)
                              ..rotateY((2 * pi) * controller.flipAnim.value),
                            alignment: Alignment.center,
                            child: Container(
                                height: 100.0,
                                width: 100.0,
                                color: Colors.green.withOpacity(0.2),
                                child: RotationTransition(
                                  turns: controller.flipAnim,
                                  child: Center(
                                    child: Text('Flip',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    );
                  }));
        });
  }
}
