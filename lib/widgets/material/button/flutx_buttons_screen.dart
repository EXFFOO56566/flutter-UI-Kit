import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class FxButtonsScreen extends StatefulWidget {
  @override
  _FxButtonsScreenState createState() => _FxButtonsScreenState();
}

class _FxButtonsScreenState extends State<FxButtonsScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.onPrimary,
                ),
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
              ),
              FxButton.medium(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.onPrimary,
                ),
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
              ),
              FxButton.large(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.onPrimary,
                ),
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
              ),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                buttonType: FxButtonType.outlined,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                borderColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Small',
                  color: theme.primaryColor,
                ),
              ),
              FxButton.medium(
                buttonType: FxButtonType.outlined,
                borderColor: theme.primaryColor,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Medium',
                  color: theme.primaryColor,
                ),
              ),
              FxButton.large(
                buttonType: FxButtonType.outlined,
                borderColor: theme.primaryColor,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Large',
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: FxText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              FxButton.medium(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: FxText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              FxButton.large(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: FxText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.primary,
                ),
                splashColor: theme.primaryColor.withAlpha(40),
                buttonType: FxButtonType.text,
              ),
              FxButton.medium(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.primary,
                ),
                buttonType: FxButtonType.text,
                splashColor: theme.primaryColor.withAlpha(40),
              ),
              FxButton.large(
                onPressed: () {},
                elevation: 0,
                child: FxText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.primary,
                ),
                buttonType: FxButtonType.text,
                splashColor: theme.primaryColor.withAlpha(40),
              ),
            ],
          ),
          FxSpacing.height(24),
          FxButton.block(
            onPressed: () {},
            elevation: 0,
            splashColor: theme.colorScheme.onPrimary.withAlpha(60),
            child: FxText.bodyMedium(
              'Block',
              color: theme.colorScheme.onPrimary,
            ),
            backgroundColor: theme.primaryColor,
          ),
          FxSpacing.height(24),
          FxButton.block(
            onPressed: () {},
            elevation: 8,
            splashColor: theme.colorScheme.onPrimary.withAlpha(60),
            child: FxText.bodyMedium(
              'Elevation',
              color: theme.colorScheme.onPrimary,
            ),
            backgroundColor: theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
