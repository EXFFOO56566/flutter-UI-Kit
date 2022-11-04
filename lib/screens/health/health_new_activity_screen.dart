import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class HealthNewActivityScreen extends StatefulWidget {
  @override
  _HealthNewActivityScreenState createState() =>
      _HealthNewActivityScreenState();
}

class _HealthNewActivityScreenState extends State<HealthNewActivityScreen> {
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ),
        body: ListView(
          padding: FxSpacing.top(0),
          children: [
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "What's your",
                      style: FxTextStyle.headlineSmall(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600)),
                  TextSpan(
                      text: " goal?",
                      style: FxTextStyle.headlineSmall(
                          color: customTheme.colorSuccess, fontWeight: 600)),
                ]),
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 8, 24, 0),
              child: FxText.bodyMedium(
                "We need to know your fitness goal",
                color: theme.colorScheme.onBackground,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(40, 40, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  singleChoice(title: "To lose weight"),
                  Container(
                      margin: FxSpacing.top(16),
                      child: singleChoice(title: "To lose fat")),
                  Container(
                      margin: FxSpacing.top(16),
                      child: singleChoice(title: "To gain weight")),
                  Container(
                      margin: FxSpacing.top(16),
                      child: singleChoice(title: "To gain height")),
                  Container(
                      margin: FxSpacing.top(16),
                      child: singleChoice(title: "To build muscle")),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleChoice({required String title}) {
    return FxContainer(
      padding: FxSpacing.fromLTRB(24, 16, 0, 16),
      borderRadiusAll: 4,
      child: FxText.bodyLarge(title,
          color: theme.colorScheme.onBackground, fontWeight: 500),
    );
  }
}
