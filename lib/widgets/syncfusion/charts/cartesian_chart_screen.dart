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

import 'cartesian_charts/area_default.dart';
import 'cartesian_charts/bar_default.dart';
import 'cartesian_charts/box_whisker_default.dart';
import 'cartesian_charts/bubble_default.dart';
import 'cartesian_charts/column_default.dart';
import 'cartesian_charts/full_stacked_default.dart';
import 'cartesian_charts/hilo_default.dart';
import 'cartesian_charts/histogram_default.dart';
import 'cartesian_charts/line_default.dart';
import 'cartesian_charts/line_stacked_default.dart';
import 'cartesian_charts/range_area_default.dart';
import 'cartesian_charts/range_column_default.dart';
import 'cartesian_charts/scatter_default.dart';
import 'cartesian_charts/spline_area_default.dart';
import 'cartesian_charts/spline_default.dart';
import 'cartesian_charts/spline_range_area_default.dart';
import 'cartesian_charts/step_area_default.dart';
import 'cartesian_charts/step_line_default.dart';
import 'cartesian_charts/waterfall_default.dart';

class CartesianChartScreen extends StatefulWidget {
  @override
  _CartesianChartScreenState createState() => _CartesianChartScreenState();
}

class _CartesianChartScreenState extends State<CartesianChartScreen> {
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
          'Cartesian Chart',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 19,
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
      'Line',
      'Column',
      'Spline',
      'Area',
      'Bar',
      'Bubble',
      'Scatter',
      'Step-Line',
      'Range-Column',
      'Line-Stacked',
      'Full-Stacked',
      'Hilo',
      'Spline-Area',
      'Step-Area',
      'Range-Area',
      'Spline-Range-Area',
      'Histogram',
      'Box-Whisker',
      'Waterfall',
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
      LineDefault(),
      ColumnDefault(),
      SplineDefault(),
      AreaDefault(),
      BarDefault(),
      BubbleDefault(),
      ScatterDefault(),
      StepLineDefault(),
      RangeColumnDefault(),
      LineStackedDefault(),
      FullStackedDefault(),
      HiloDefault(),
      SplineAreaDefault(),
      StepAreaDefault(),
      RangeAreaDefault(),
      SplineRangeAreaDefault(),
      HistogramDefault(),
      BoxWhiskerDefault(),
      WaterfallDefault(),
    ];
  }
}
