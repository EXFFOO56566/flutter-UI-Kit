import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HandymanSubscriptionScreen extends StatefulWidget {
  @override
  _HandymanSubscriptionScreenState createState() =>
      _HandymanSubscriptionScreenState();
}

class _HandymanSubscriptionScreenState
    extends State<HandymanSubscriptionScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleLarge("Subscriptions",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          children: [
            Container(
              margin: FxSpacing.top(24),
              child: FxText.headlineMedium(
                "21",
                color: theme.colorScheme.onBackground,
                fontWeight: 700,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: FxSpacing.top(0),
              child: FxText.bodyMedium(
                "Days remaining",
                color: theme.colorScheme.onBackground,
                fontWeight: 500,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 32, 24, 0),
              child: FxText.bodySmall("RENEW SUBSCRIPTION",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  muted: true),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  subscriptionWidget(
                      title: "Premium Plan",
                      description: "Get unlimited A for month",
                      value: 19),
                  subscriptionWidget(
                      title: "Economy Plan",
                      description: "Get unlimited B for month",
                      value: 29),
                  subscriptionWidget(
                      title: "Business Plan",
                      description: "Get unlimited C for month",
                      value: 59),
                  Container(
                    margin: FxSpacing.top(8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: FxText.bodySmall("CONTACT US",
                          letterSpacing: 0.4,
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget subscriptionWidget(
      {required String title, required String description, double? value}) {
    return Container(
      margin: FxSpacing.bottom(16),
      padding: FxSpacing.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: customTheme.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.titleSmall(title,
                  color: theme.colorScheme.primary, fontWeight: 600),
              FxText.titleSmall("\$" + value.toString(),
                  color: theme.colorScheme.primary, fontWeight: 600),
            ],
          ),
          FxText.bodyMedium(description, color: theme.colorScheme.onBackground),
        ],
      ),
    );
  }
}
