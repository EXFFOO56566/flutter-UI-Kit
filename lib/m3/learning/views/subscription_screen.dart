import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/subscription_controller.dart';
import '../models/pricing.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late ThemeData theme;
  late SubscriptionController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = FxControllerStore.putOrFind(SubscriptionController());
  }

  Widget _buildSinglePlan(Pricing pricing) {
    bool selected = controller.selectedPlan == pricing;
    return FxContainer.bordered(
      onTap: () {
        controller.onSelectPlan(pricing);
      },
      paddingAll: 16,
      margin: FxSpacing.bottom(20),
      border: Border.all(
          color: selected ? theme.colorScheme.primary : Colors.transparent),
      color: theme.colorScheme.primaryContainer,
      borderRadiusAll: Constant.containerRadius.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.bodyMedium(
            pricing.name,
            color: theme.colorScheme.primary,
            fontWeight: selected ? 700 : 500,
            letterSpacing: 0.3,
          ),
          FxSpacing.height(8),
          Row(
            children: [
              FxText.displaySmall(
                '\$ ' + pricing.price.toString(),
                fontWeight: selected ? 700 : 500,
              ),
              FxText.bodyMedium(
                ' /Month ',
                muted: true,
                letterSpacing: 0,
                fontWeight: selected ? 700 : 500,
                color: selected ? theme.colorScheme.primary : null,
              ),
            ],
          ),
          FxSpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.bodySmall(
                pricing.description,
                color: selected ? theme.colorScheme.primary : null,
              ),
              FxContainer.bordered(
                borderRadiusAll: Constant.buttonRadius.large,
                border: Border.all(color: theme.colorScheme.primary),
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.primaryContainer,
                padding: FxSpacing.xy(32, 10),
                child: FxText.labelLarge(
                  'Buy',
                  color: selected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.primary,
                ),
              ),
            ],
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
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
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
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          children: [
            FxText.titleLarge(
              'Pricing',
              fontWeight: 700,
              color: theme.colorScheme.primary,
            ),
            FxText.bodySmall(
              'Select a suitable plan',
              muted: true,
              color: theme.colorScheme.primary,
            ),
            FxSpacing.height(20),
            ...controller.pricingPlans!
                .map((pricing) => _buildSinglePlan(pricing))
                .toList(),
          ],
        ),
      );
    }
  }
}
