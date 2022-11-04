import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import '../../../loading_effect.dart';
import '../controllers/subscription_controller.dart';
import '../models/subscription.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

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
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.put(SubscriptionController());
  }

  Widget _buildSingleBenefit(String benefit) {
    return Row(
      children: [
        FxContainer.rounded(
          paddingAll: 4,
          margin: FxSpacing.y(6),
          color: theme.colorScheme.primary.withAlpha(28),
          child: Icon(
            FeatherIcons.check,
            size: 12,
            color: theme.colorScheme.primary,
          ),
        ),
        FxSpacing.width(12),
        FxText.bodySmall(
          benefit,
          xMuted: true,
        ),
      ],
    );
  }

  List<Widget> _buildSubscriptionList() {
    List<Widget> list = [];

    for (Subscription subscription in controller.subscriptions!) {
      bool selected = subscription == controller.subscription;
      list.add(
        FxContainer.bordered(
          onTap: () {
            controller.selectSubscription(subscription);
          },
          color: selected
              ? theme.colorScheme.primary.withAlpha(30)
              : theme.cardTheme.color,
          border: selected
              ? Border.all(color: theme.colorScheme.primary)
              : Border.all(color: theme.colorScheme.onBackground),
          borderRadiusAll: 4,
          padding: FxSpacing.xy(32, 24),
          child: Column(
            children: [
              FxText.titleMedium(
                subscription.period,
                fontWeight: 700,
              ),
              FxSpacing.height(4),
              FxText.bodySmall(
                subscription.trial,
                fontSize: 10,
                xMuted: true,
              ),
              FxSpacing.height(20),
              FxText.bodyLarge(
                '\$' + subscription.price.toString(),
                fontWeight: 700,
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground,
              ),
              FxSpacing.height(2),
              FxText.bodySmall(
                subscription.description,
                fontSize: 10,
                xMuted: true,
              ),
              FxSpacing.height(20),
              Row(
                children: [
                  Icon(
                    FeatherIcons.barChart2,
                    size: 18,
                    color: theme.colorScheme.onBackground.withAlpha(160),
                  ),
                  FxSpacing.width(8),
                  Icon(FeatherIcons.edit2,
                      size: 18,
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                  FxSpacing.width(8),
                  Icon(FeatherIcons.calendar,
                      size: 18,
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return list;
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
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
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
            ).autoDirection(),
          ),
          title: FxText.titleMedium(
            'Get Premium Features',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Padding(
          padding: FxSpacing.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildSubscriptionList(),
              ),
              FxSpacing.height(24),
              Container(
                padding: FxSpacing.x(40),
                child: Column(
                  children: [
                    _buildSingleBenefit('Sale benefits before 24 hrs'),
                    _buildSingleBenefit('Discount upto 50%'),
                    _buildSingleBenefit('Access to premium items'),
                    _buildSingleBenefit('Explore trending items first'),
                  ],
                ),
              ),
              FxSpacing.height(32),
              FxText.bodySmall(
                'Get ready to enjoy premium benefits with us. Get upgraded with your account and never miss any benefit updated on your favourite items.',
                textAlign: TextAlign.center,
                muted: true,
              ),
              FxSpacing.height(40),
              FxButton.block(
                onPressed: () {
                  controller.goBack();
                },
                elevation: 0,
                borderRadiusAll: 4,
                splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                backgroundColor: theme.colorScheme.primary,
                child: FxText.labelLarge(
                  'Try free and subscribe',
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
