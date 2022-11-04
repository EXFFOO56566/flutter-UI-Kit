/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'circular_charts/doughnut_default.dart';
import 'circular_charts/doughnut_elevated.dart';
import 'circular_charts/doughnut_gradient.dart';
import 'circular_charts/doughnut_rounded.dart';
import 'circular_charts/doughnut_semi.dart';
import 'circular_charts/pie_default.dart';
import 'circular_charts/pie_gradient.dart';
import 'circular_charts/pie_radius.dart';
import 'circular_charts/pie_semi.dart';
import 'circular_charts/radial_default.dart';
import 'circular_charts/radial_gradient.dart';
import 'circular_charts/radial_legend.dart';
import 'circular_charts/radial_overfilled.dart';

class CircularChartScreen extends StatefulWidget {
  @override
  _CircularChartScreenState createState() => _CircularChartScreenState();
}

class _CircularChartScreenState extends State<CircularChartScreen> {
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
          'Circular Chart',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 13,
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
                TabBar(
                  isScrollable: true,
                  tabs: getTabs(),
                )
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
      'Pie',
      'Pie-Radius',
      'Pie-Semi',
      'Pie-Gradient',
      'Doughnut',
      'Doughnut-Elevated',
      'Doughnut-Rounded',
      'Doughnut-Semi',
      'Doughnut-Gradient',
      'Radial',
      'Radial-Legend',
      'Radial-Gradient',
      'Radial-Overfilled',
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
      PieDefault(),
      PieRadius(),
      PieSemi(),
      PieGradient(),
      DoughnutDefault(),
      DoughnutElevated(),
      DoughnutRounded(),
      DoughnutSemi(),
      DoughnutGradient(),
      RadialDefault(),
      RadialLegend(),
      RadialGradientChart(),
      RadialOverfilled(),
    ];
  }
}
