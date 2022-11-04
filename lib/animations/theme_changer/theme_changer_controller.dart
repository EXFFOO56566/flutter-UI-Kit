import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';
import '../../theme/app_notifier.dart';
import '../../theme/app_theme.dart';
import '../../theme/theme_type.dart';

class ThemeChangerController extends FxController {
  TickerProvider ticker;
  ThemeChangerController(this.ticker);
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    scaleController =
        AnimationController(vsync: ticker, duration: Duration(seconds: 1));
    scaleAnimation =
        Tween<double>(begin: 0.0, end: 800.0).animate(scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              changeTheme();
              scaleController.reset();
            }
          });
  }

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.dark);
    } else {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.light);
    }
    update();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  String getTag() {
    return "theme_changer_controller";
  }
}
