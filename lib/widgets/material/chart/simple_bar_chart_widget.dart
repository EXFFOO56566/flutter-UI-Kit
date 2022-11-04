//TODO:: Due to null safety (Chart plugin is not support null safety). But you can use if you are not enable null safety

/*
* File : Simple Bar Chart
* Version : 1.0.0
* */

//
//
// import 'package:flutkit/app_notifier.dart';
// import 'package:charts_flutter/flutter.dart';
// import 'package:flutter/material.dart' as Material;
// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
//
// import '../../../app_theme.dart';
//
// class SimpleBarChartWidget extends StatefulWidget {
//   @override
//   _SimpleBarChartWidgetState createState() => _SimpleBarChartWidgetState();
// }
//
// class _SimpleBarChartWidgetState extends State<SimpleBarChartWidget> {
//
//   late Material.ThemeData themeData;
//
//   @override
//   Widget build(BuildContext context) {
//     themeData = Theme.of(context);
//     return Consumer<AppThemeNotifier>(
//       builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
//         return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
//             home: Scaffold(
//                 appBar: AppBar(
//                   leading: IconButton(
//                     onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
//                   ),
//                   title: Text("Bar Chart",
//                       style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight:600)),
//                 ),
//                 body: Container(
//                   padding: Material.EdgeInsets.all(32),
//                     color: themeData.backgroundColor,
//                     child: Center(
//                       child: _SimpleBarChart.withSampleData(),
//                     ))));
//       },
//     );
//   }
// }
//
// class _SimpleBarChart extends StatelessWidget {
//   final List<charts.Series<dynamic, String>> seriesList;
//   final bool animate;
//
//
//   _SimpleBarChart(this.seriesList, {required this.animate});
//
//   factory _SimpleBarChart.withSampleData() {
//     return new _SimpleBarChart(
//       _createSampleData(),
//       animate: true,
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Material.ThemeData themeData = Theme.of(context);
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       domainAxis: charts.OrdinalAxisSpec(renderSpec: SmallTickRendererSpec(labelStyle: TextStyleSpec(
//           color: Color(r: themeData.colorScheme.onBackground.red,g: themeData.colorScheme.onBackground.green,b: themeData.colorScheme.onBackground.blue,)
//       ))),
//       primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: SmallTickRendererSpec(labelStyle: TextStyleSpec(
//           color: Color(r: themeData.colorScheme.onBackground.red,g: themeData.colorScheme.onBackground.green,b: themeData.colorScheme.onBackground.blue,)
//       ))),
//
//     );
//   }
//
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final data = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];
//
//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }
//
// class OrdinalSales {
//   final String year;
//   final int sales;
//
//   OrdinalSales(this.year, this.sales);
// }
