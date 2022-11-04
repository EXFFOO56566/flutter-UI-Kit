import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/subscription_controller.dart';
import '../models/subscription.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SubscriptionController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(SubscriptionController());
  }

  List<Widget> _buildPlanList() {
    List<Widget> list = [];
    for (Subscription subscription in controller.subscriptions!) {
      list.add(_buildSinglePlan(subscription));
    }
    return list;
  }

  Widget _buildSinglePlan(Subscription subscription) {
    bool selected = subscription == controller.subscription;
    return FxContainer.bordered(
      borderRadiusAll: 4,
      width: (MediaQuery.of(context).size.width - 60) / 2,
      onTap: () {
        controller.selectPlan(subscription);
      },
      color:
          selected ? customTheme.muviPrimary.withAlpha(30) : customTheme.card,
      border: Border.all(
          color: selected ? customTheme.muviPrimary : customTheme.border),
      child: Column(
        children: [
          FxText.bodyLarge(
            subscription.type,
            fontWeight: 600,
          ),
          FxSpacing.height(8),
          FxText.titleMedium(
            '\$' + subscription.price.toString(),
            fontWeight: 700,
          ),
          FxText.bodySmall(
            '/per month',
            xMuted: true,
          ),
          FxSpacing.height(8),
          FxText.labelMedium(
            subscription.features,
          ),
          FxSpacing.height(8),
          FxButton(
            buttonType:
                selected ? FxButtonType.elevated : FxButtonType.outlined,
            onPressed: () {
              controller.selectPlan(subscription);
            },
            padding: FxSpacing.xy(12, 8),
            backgroundColor:
                selected ? customTheme.muviPrimary : Colors.transparent,
            elevation: 0,
            borderColor: customTheme.muviPrimary,
            borderRadiusAll: 4,
            splashColor: (!selected
                    ? customTheme.muviPrimary
                    : customTheme.muviOnPrimary)
                .withAlpha(40),
            child: FxText.bodySmall(
              selected ? 'Selected' : 'Choose Plan',
              color: selected
                  ? customTheme.muviOnPrimary
                  : customTheme.muviPrimary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SubscriptionController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Container(
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium(
            'Choose your plan',
            fontWeight: 600,
          ),
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          children: [
            FxContainer(
              padding: FxSpacing.xy(32, 20),
              borderRadiusAll: 4,
              border: Border.all(color: customTheme.muviPrimary),
              color: customTheme.muviPrimary.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    'Upgrade your \nplan anytime!',
                    textAlign: TextAlign.center,
                    color: customTheme.muviPrimary,
                  ),
                  FxContainer(
                    color: customTheme.muviPrimary,
                    padding: FxSpacing.xy(20, 10),
                    borderRadiusAll: 20,
                    child: FxText.labelMedium(
                      'Upgrade',
                      color: customTheme.muviOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Wrap(
              children: _buildPlanList(),
              spacing: 20,
              runSpacing: 20,
            ),
          ],
        ),
      );
    }
  }
}
