import 'package:flutkit/animations/theme_changer/theme_changer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../../theme/app_theme.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  _ThemeChangerScreenState createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late ThemeChangerController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.putOrFind(ThemeChangerController(this));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ThemeChangerController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: FxText.titleMedium("Theme Animation"),
              elevation: 0,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(FeatherIcons.chevronLeft),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: controller.scaleAnimation,
                    builder: (context, child) => Transform.scale(
                      scale: controller.scaleAnimation.value,
                      child: FxContainer.rounded(
                        paddingAll: 1,
                        child: Container(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.scaleController.forward();
                    },
                    child: FxContainer.rounded(
                      child: Icon(
                        Icons.wb_sunny_sharp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
