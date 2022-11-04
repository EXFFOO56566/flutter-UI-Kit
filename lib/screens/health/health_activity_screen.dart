import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HealthActivityScreen extends StatefulWidget {
  @override
  _HealthActivityScreenState createState() => _HealthActivityScreenState();
}

class _HealthActivityScreenState extends State<HealthActivityScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  Color? color1, color2, color3;

  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    color1 = Colors.lightBlueAccent;
    color2 = Colors.purpleAccent;
    color3 = Colors.deepPurpleAccent;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          FxSpacing.fromLTRB(0, FxSpacing.safeAreaTop(context) + 20, 0, 16),
      children: [
        Container(
          margin: FxSpacing.fromLTRB(48, 0, 48, 0),
          child: FxText.headlineSmall(
            "Today you have consumed 150 cal",
            color: theme.colorScheme.onBackground,
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: FxSpacing.top(36),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                    backgroundColor: color1!.withAlpha(20),
                    value: 0.3,
                    valueColor: AlwaysStoppedAnimation<Color?>(color1),
                    strokeWidth: 9),
              ),
              Container(
                width: 165,
                height: 165,
                child: CircularProgressIndicator(
                    backgroundColor: color2!.withAlpha(20),
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation<Color?>(color2),
                    strokeWidth: 9),
              ),
              Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: CircularProgressIndicator(
                    backgroundColor: color3!.withAlpha(20),
                    value: 0.7,
                    valueColor: AlwaysStoppedAnimation<Color?>(color3),
                    strokeWidth: 9),
              ),
              Container(
                width: 120,
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxText.headlineSmall("50%",
                        color: theme.colorScheme.onBackground, fontWeight: 700),
                    FxText.bodySmall("of daily goals",
                        letterSpacing: -0.2,
                        color: theme.colorScheme.onBackground,
                        xMuted: true,
                        fontWeight: 600)
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(32, 48, 32, 0),
          child: Column(
            children: [
              singleElement(
                  color: color1,
                  type: "Carb",
                  inGram: "150",
                  inPercentage: "40"),
              Container(
                margin: FxSpacing.top(16),
                child: singleElement(
                    color: color2,
                    type: "Protein",
                    inGram: "120",
                    inPercentage: "34"),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleElement(
                    color: color3,
                    type: "Fat",
                    inGram: "40",
                    inPercentage: "36"),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 32, 24, 0),
          child: FxText.bodySmall("Resume Activity".toUpperCase(),
              fontSize: 11.8,
              muted: true,
              color: theme.colorScheme.onBackground,
              fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Column(
            children: [
              singleActivity(
                  iconData: MdiIcons.run,
                  color: color1!,
                  type: "Run",
                  time: "10 : 45"),
              Container(
                margin: FxSpacing.top(16),
                child: singleActivity(
                    iconData: MdiIcons.weightLifter,
                    color: color2!,
                    type: "Weight Lifeting",
                    time: "4 : 18"),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleActivity(
                    iconData: MdiIcons.swim,
                    color: color3!,
                    type: "Swimming",
                    time: "10 : 00"),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleActivity(
                    iconData: MdiIcons.runFast,
                    color: theme.colorScheme.primary,
                    type: "Fast Run",
                    time: "0 : 00"),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleElement(
      {Color? color,
      required String type,
      required String inGram,
      required String inPercentage}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(4))),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Row(
                children: [
                  Expanded(
                    child: FxText.bodyLarge(type,
                        color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Center(
                      child: FxText.bodyLarge(inGram + " g",
                          color: theme.colorScheme.onBackground),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FxText.titleSmall(inPercentage + "%",
                          fontWeight: 600,
                          color: theme.colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleActivity(
      {IconData? iconData,
      required Color color,
      required String time,
      required String type,
      bool? selected}) {
    return FxContainer.bordered(
      padding: FxSpacing.xy(12, 12),
      borderRadiusAll: 4,
      child: Row(
        children: [
          Container(
            padding: FxSpacing.all(6),
            decoration: BoxDecoration(
                color: color.withAlpha(40),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Icon(
              iconData,
              color: color,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: FxText.bodyMedium(type,
                  color: theme.colorScheme.onBackground, fontWeight: 500),
            ),
          ),
          FxText.bodyMedium(time,
              color: theme.colorScheme.onBackground, fontWeight: 600),
          Container(
            margin: FxSpacing.left(16),
            child: Icon(
              MdiIcons.play,
              color: theme.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
