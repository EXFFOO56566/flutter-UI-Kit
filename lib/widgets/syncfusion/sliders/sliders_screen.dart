import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'sliders/slider_interval_screen.dart';
import 'sliders/slider_label_screen.dart';
import 'sliders/slider_step_screen.dart';
import 'sliders/slider_tooltip_screen.dart';
import 'sliders/vertical_slider_interval_screen.dart';
import 'sliders/vertical_slider_label_screen.dart';
import 'sliders/vertical_slider_step_screen.dart';
import 'sliders/vertical_slider_tooltip_screen.dart';

class SlidersScreen extends StatefulWidget {
  @override
  _SlidersScreenState createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(FeatherIcons.chevronLeft).autoDirection(),
        ),
        title: FxText.titleMedium(
          'Sliders',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 8,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            toolbarHeight: 48,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: Container(
            padding: FxSpacing.all(8),
            child: TabBarView(children: getTabContents()),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Slider',
      'Interval',
      'Tooltip',
      'Step',
      'Vertical',
      'Vertical-Interval',
      'Vertical-Tooltip',
      'Vertical-Step',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: FxText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      SliderLabelScreen(),
      SliderIntervalScreen(),
      SliderTooltipScreen(),
      SliderStepScreen(),
      VerticalSliderLabelScreen(),
      VerticalSliderIntervalScreen(),
      VerticalSliderTooltipScreen(),
      VerticalSliderStepScreen(),
    ];
  }
}
