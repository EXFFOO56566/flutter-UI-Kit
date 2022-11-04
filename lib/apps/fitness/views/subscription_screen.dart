import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/subscription_controller.dart';

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

  Widget _buildSingleBenefit(String benefit) {
    return Row(
      children: [
        FxContainer.rounded(
          paddingAll: 4,
          margin: FxSpacing.y(8),
          color: customTheme.fitnessPrimary.withAlpha(30),
          child: Icon(
            FeatherIcons.check,
            size: 12,
            color: customTheme.fitnessPrimary,
          ),
        ),
        FxSpacing.width(16),
        FxText.bodySmall(
          benefit,
          xMuted: true,
        ),
      ],
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
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
        child: LoadingEffect.getSearchLoadingScreen(context),
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              Icons.chevron_left,
              size: 20,
            ),
          ),
          title: FxText.titleMedium(
            'Subscription',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Padding(
          padding: FxSpacing.fromLTRB(20, 8, 20, 20),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxContainer(
                borderRadiusAll: 4,
                color: customTheme.fitnessPrimary.withAlpha(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.labelMedium(
                      'Upgrade your plan to enjoy \nour premium gym plan. ',
                      color: customTheme.fitnessPrimary,
                    ),
                    FxButton.small(
                      onPressed: () {
                        controller.goBack();
                      },
                      elevation: 0,
                      borderRadiusAll: 4,
                      padding: FxSpacing.x(16),
                      child: FxText.labelMedium(
                        'Upgrade',
                        color: customTheme.fitnessOnPrimary,
                        fontWeight: 600,
                      ),
                      splashColor: customTheme.fitnessOnPrimary.withAlpha(40),
                      backgroundColor: customTheme.fitnessPrimary,
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxContainer.bordered(
                color: customTheme.cardDark,
                borderRadiusAll: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FxContainer(
                          paddingAll: 8,
                          borderRadiusAll: 4,
                          color: customTheme.fitnessPrimary,
                          child: Icon(
                            FeatherIcons.creditCard,
                            size: 16,
                            color: customTheme.fitnessOnPrimary,
                          ),
                        ),
                        FxSpacing.width(20),
                        FxText.bodyLarge(
                          'Premium',
                          fontWeight: 600,
                        ),
                      ],
                    ),
                    FxSpacing.height(16),
                    Row(
                      children: [
                        FxText.headlineSmall(
                          '\$29',
                          fontWeight: 700,
                        ),
                        FxText.titleMedium(
                          ' /month',
                          muted: true,
                        ),
                      ],
                    ),
                    FxSpacing.height(8),
                    FxContainer(
                      padding: FxSpacing.xy(8, 4),
                      borderRadiusAll: 2,
                      color: customTheme.fitnessPrimary.withAlpha(30),
                      child: FxText.bodySmall(
                        '1 week free trial',
                        color: customTheme.fitnessPrimary,
                      ),
                    ),
                    FxSpacing.height(20),
                    Divider(),
                    FxSpacing.height(20),
                    _buildSingleBenefit('Personal Assistance and Training'),
                    _buildSingleBenefit('Music and Video Entertainment'),
                    _buildSingleBenefit('Nutritional Support'),
                    _buildSingleBenefit('Weekly Steam and Physiotherapy'),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxButton.block(
                buttonType: FxButtonType.outlined,
                splashColor: customTheme.fitnessPrimary.withAlpha(60),
                borderColor: customTheme.fitnessPrimary,
                borderRadiusAll: 4,
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Choose Premium',
                  color: customTheme.fitnessPrimary,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
