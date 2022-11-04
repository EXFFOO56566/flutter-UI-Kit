import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/single_coin_controller.dart';
import '../models/coin.dart';

class SingleCoinScreen extends StatefulWidget {
  final Coin coin;

  const SingleCoinScreen({Key? key, required this.coin}) : super(key: key);

  @override
  _SingleCoinScreenState createState() => _SingleCoinScreenState();
}

class _SingleCoinScreenState extends State<SingleCoinScreen> {
  late ThemeData theme;
  late SingleCoinController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(SingleCoinController(widget.coin));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleCoinController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    controller.goBack();
                  },
                  child: Icon(FeatherIcons.chevronLeft)),
            ),
            body: Padding(
              padding: FxSpacing.nTop(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleView(),
                        FxSpacing.height(20),
                        coinPrice(),
                        FxSpacing.height(20),
                        intervals(),
                        FxSpacing.height(40),
                        coinChart(),
                        FxSpacing.height(40),
                        chartOption(),
                      ],
                    ),
                  ),
                  FxButton.block(
                    onPressed: () {},
                    elevation: 0,
                    borderRadiusAll: Constant.buttonRadius.xs,
                    child: FxText.labelLarge(
                      "Buy Crypto",
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget titleView() {
    return Row(
      children: [
        FxContainer(
          paddingAll: 12,
          borderRadiusAll: Constant.containerRadius.xs,
          child: Image(
            height: 32,
            width: 32,
            image: AssetImage(controller.coin.image),
          ),
        ),
        FxSpacing.width(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    controller.coin.name,
                    fontWeight: 700,
                  ),
                  FxText.bodyMedium(
                    "USD 2,325.50",
                    fontWeight: 700,
                  ),
                ],
              ),
              FxSpacing.height(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    controller.coin.code,
                    fontWeight: 600,
                    xMuted: true,
                  ),
                  FxText.bodyMedium("+3.05%",
                      fontWeight: 600, color: theme.colorScheme.primary),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget coinPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.bodySmall(
          controller.coin.name + " Price",
          xMuted: true,
          fontWeight: 600,
        ),
        FxSpacing.height(8),
        FxText.titleLarge(
          "\$ " + controller.coin.price.toString(),
          fontWeight: 700,
        ),
        FxSpacing.height(4),
        FxText.titleSmall(
          "\$ " +
              controller.coin.priceChange.toString() +
              " (" +
              controller.coin.percentChange.toString() +
              "%)",
          fontWeight: 600,
          color: (controller.coin.percentChange.toString().startsWith("-"))
              ? theme.colorScheme.error
              : theme.colorScheme.primary,
        ),
      ],
    );
  }

  Widget coinChart() {
    return SizedBox(
      height: 240,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        primaryXAxis: NumericAxis(
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            isVisible: true,
            interval: 200,
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(size: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        series: controller.getCoinSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget intervals() {
    List<Widget> list = [];
    for (int i = 0; i < controller.intervals.length; i++) {
      list.add(FxContainer.rounded(
        onTap: () {
          controller.changeInterval(i);
        },
        paddingAll: 12,
        color: controller.selected == i
            ? theme.colorScheme.primary
            : theme.scaffoldBackgroundColor,
        bordered: true,
        border: Border.all(
            color: controller.selected == i
                ? theme.colorScheme.primary
                : theme.dividerColor),
        child: Center(
            child: FxText.bodySmall(controller.intervals[i],
                fontWeight: 600,
                color: controller.selected == i
                    ? theme.colorScheme.onPrimary
                    : null)),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  Widget chartOption() {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: theme.colorScheme.primary,
        ),
        FxSpacing.width(4),
        FxText.bodyMedium(
          "USD",
          fontWeight: 600,
        ),
        FxSpacing.width(16),
        Icon(
          Icons.check_circle,
          color: theme.colorScheme.primary,
        ),
        FxSpacing.width(4),
        FxText.bodyMedium(
          "Market cap",
          fontWeight: 600,
        ),
      ],
    );
  }
}
