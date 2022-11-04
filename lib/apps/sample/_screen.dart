import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import '_controller.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late Controller controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(Controller());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<Controller>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Center(
          child: FxText.bodyLarge(
            'Loading ...',
            fontWeight: 600,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.top(16),
          children: [],
        ),
      );
    }
  }
}
