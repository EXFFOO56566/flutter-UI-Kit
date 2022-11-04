/*
* File : Cupertino Widget Home Page
* Version : 1.0.0
* */

import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/cupertino/dialog/cupertino_dialogs_screen.dart';
import 'package:flutkit/widgets/cupertino/form/cupertino_inputs_screen.dart';
import 'package:flutkit/widgets/syncfusion/charts/cartesian_chart_screen.dart';
import 'package:flutkit/widgets/syncfusion/charts/circular_chart_screen.dart';
import 'package:flutkit/widgets/syncfusion/charts/other_chart_screen.dart';
import 'package:flutkit/widgets/syncfusion/date_range/date_ranges_screen.dart';
import 'package:flutkit/widgets/syncfusion/gauges/gauges_screen.dart';
import 'package:flutkit/widgets/syncfusion/sliders/range_selectors_screen.dart';
import 'package:flutkit/widgets/syncfusion/sliders/range_sliders_screen.dart';
import 'package:flutkit/widgets/syncfusion/sliders/sliders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import 'single_grid_item.dart';

class OthersHome extends StatefulWidget {
  @override
  State<OthersHome> createState() => _OthersHomeState();
}

class _OthersHomeState extends State<OthersHome> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return ListView(
        padding: FxSpacing.x(20),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          FxText.titleSmall(
            "SYNCFUSION",
            fontWeight: 700,
            muted: true,
          ),
          FxSpacing.height(20),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: FxSpacing.zero,
              mainAxisSpacing: 20,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              children: <Widget>[
                SinglePageItem(
                  title: "Cartesian Chart",
                  icon: Images.cartesianBarIcon,
                  navigation: CartesianChartScreen(),
                ),
                SinglePageItem(
                  title: "Circular Chart",
                  icon: Images.pieChartIcon,
                  navigation: CircularChartScreen(),
                ),
                SinglePageItem(
                  title: "Other Chart",
                  icon: Images.cartesianBarSyncIcon,
                  navigation: OtherChartScreen(),
                ),
                SinglePageItem(
                  title: "Date Range",
                  icon: Images.calendarIcon,
                  navigation: DateRangesScreen(),
                ),
                SinglePageItem(
                  title: "Gauges",
                  icon: Images.gaugeIcon,
                  navigation: GaugesScreen(),
                ),
                SinglePageItem(
                  title: "Sliders",
                  icon: Images.sliderHorizontalIcon,
                  navigation: SlidersScreen(),
                ),
                SinglePageItem(
                  title: "Range Sliders",
                  icon: Images.rangeSliderHorizontalIcon,
                  navigation: RangeSlidersScreen(),
                ),
                SinglePageItem(
                  title: "Range Selector",
                  icon: Images.rangeSelectorIcon,
                  navigation: RangeSelectorsScreen(),
                ),
              ]),
          FxSpacing.height(20),
          FxText.titleSmall(
            "CUPERTINO",
            fontWeight: 700,
            muted: true,
          ),
          FxSpacing.height(20),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: FxSpacing.zero,
              mainAxisSpacing: 20,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              children: <Widget>[
                SinglePageItem(
                  title: "Dialogs",
                  icon: Images.dialogIcon,
                  navigation: CupertinoDialogsScreen(),
                ),
                SinglePageItem(
                  title: "Inputs",
                  icon: Images.formIcon,
                  navigation: CupertinoInputsScreen(),
                ),
              ]),
          FxContainer(
            margin: FxSpacing.y(20),
            borderRadiusAll: 4,
            color: theme.colorScheme.primary.withAlpha(24),
            child: Center(
              child: FxText.bodyMedium("More widgets are coming very soon...",
                  fontWeight: 600, color: theme.colorScheme.primary),
            ),
          )
        ],
      );
    });
  }
}
