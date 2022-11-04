//TODO:: Due to null safety (Chart plugin is not support null safety). But you can use if you are not enable null safety

/*
* File : Group Stack Bar
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
// class GroupStackChartWidget extends StatefulWidget {
//   @override
//   _GroupStackChartWidgetState createState() => _GroupStackChartWidgetState();
// }
//
// class _GroupStackChartWidgetState extends State<GroupStackChartWidget> {
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
//                   title: Text("Group Stack Chart",
//                       style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight: 600)),
//                 ),
//                 body: Container(
//                     padding: Material.EdgeInsets.all(32),
//                     color: themeData.backgroundColor,
//                     child: Center(
//                       child: GroupedStackedBarChart.withSampleData(),
//                     ))));
//       },
//     );
//   }
// }
//
//
// class GroupedStackedBarChart extends StatelessWidget {
//   final List<charts.Series<dynamic, String>> seriesList;
//   final bool animate;
//
//   GroupedStackedBarChart(this.seriesList, {required this.animate});
//
//   factory GroupedStackedBarChart.withSampleData() {
//     return new GroupedStackedBarChart(
//       createSampleData(),
//       animate: true,
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Material.ThemeData themeData = Material.Theme.of(context) ;
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       barGroupingType: charts.BarGroupingType.groupedStacked,
//       domainAxis: charts.OrdinalAxisSpec(renderSpec: SmallTickRendererSpec(labelStyle: TextStyleSpec(
//           color: Color(r: themeData.colorScheme.onBackground.red,g: themeData.colorScheme.onBackground.green,b: themeData.colorScheme.onBackground.blue,)
//       ))),
//       primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: SmallTickRendererSpec(labelStyle: TextStyleSpec(
//           color: Color(r: themeData.colorScheme.onBackground.red,g: themeData.colorScheme.onBackground.green,b: themeData.colorScheme.onBackground.blue,)
//       ))),
//     );
//   }
//
//   static List<charts.Series<OrdinalSales, String>> createSampleData() {
//     final desktopSalesDataA = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];
//
//     final tableSalesDataA = [
//       new OrdinalSales('2014', 25),
//       new OrdinalSales('2015', 50),
//       new OrdinalSales('2016', 10),
//       new OrdinalSales('2017', 20),
//     ];
//
//     final mobileSalesDataA = [
//       new OrdinalSales('2014', 10),
//       new OrdinalSales('2015', 15),
//       new OrdinalSales('2016', 50),
//       new OrdinalSales('2017', 45),
//     ];
//
//     final desktopSalesDataB = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];
//
//     final tableSalesDataB = [
//       new OrdinalSales('2014', 25),
//       new OrdinalSales('2015', 50),
//       new OrdinalSales('2016', 10),
//       new OrdinalSales('2017', 20),
//     ];
//
//     final mobileSalesDataB = [
//       new OrdinalSales('2014', 10),
//       new OrdinalSales('2015', 15),
//       new OrdinalSales('2016', 50),
//       new OrdinalSales('2017', 45),
//     ];
//
//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Desktop A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Tablet A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tableSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Mobile A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Desktop B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesDataB,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Tablet B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tableSalesDataB,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Mobile B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesDataB,
//       ),
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
