import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CourseProfileScreen extends StatefulWidget {
  @override
  _CourseProfileScreenState createState() => _CourseProfileScreenState();
}

class _CourseProfileScreenState extends State<CourseProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _upgradeText = Generator.getDummyText(12);
  }

  late String _upgradeText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        Container(
          margin: FxSpacing.horizontal(24),
          child: Row(
            children: <Widget>[
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_3.jpg'),
                      width: 48,
                      height: 48,
                    )),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyLarge("Denise Andrew",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    FxText.bodySmall("Regular profile",
                        color: theme.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ],
                ),
              ),
            ],
          ),
        ),
        upgradeWidget(),
        Container(
          margin: FxSpacing.fromLTRB(24, 20, 24, 0),
          child: FxText.bodyMedium("Progress",
              color: theme.colorScheme.onBackground,
              fontWeight: 600,
              muted: true,
              letterSpacing: 0.25),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: <Widget>[
              progressWidget(
                  title: "Download - Flutter Lesson 1",
                  progress: 48,
                  iconData: MdiIcons.play),
              Container(
                margin: FxSpacing.top(16),
                child: progressWidget(
                    title: "Download - Flutter Lesson 2"
                        "",
                    progress: 64,
                    iconData: MdiIcons.pause),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: progressWidget(
                    title: "Download - Flutter Lesson 3"
                        "",
                    progress: 0,
                    iconData: MdiIcons.download),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget upgradeWidget() {
    return FxContainer(
      margin: FxSpacing.fromLTRB(24, 24, 24, 0),
      color: theme.colorScheme.primary,
      borderRadiusAll: 4,
      padding: FxSpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FxText.titleMedium("Upgrade\nYour Account",
                fontWeight: 700, color: theme.colorScheme.onPrimary),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.bodyMedium(_upgradeText,
                color: theme.colorScheme.onPrimary.withAlpha(160), height: 1.2),
          ),
          Container(
            margin: FxSpacing.top(16),
            padding: FxSpacing.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: customTheme.colorInfo,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: FxText.bodyMedium("Upgrade", color: customTheme.onInfo),
          ),
        ],
      ),
    );
  }

  Widget progressWidget(
      {required String title, required int progress, IconData? iconData}) {
    return FxContainer.bordered(
      padding: FxSpacing.all(16),
      borderRadiusAll: 4,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(title,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: FxSpacing.top(8),
                    child: Row(
                      children: <Widget>[
                        FxProgressBar(
                            progress: progress.toDouble(),
                            activeColor: customTheme.colorInfo,
                            inactiveColor: customTheme.card,
                            width: MediaQuery.of(context).size.width * 0.5),
                        Container(
                          margin: FxSpacing.left(16),
                          child: FxText.bodySmall(progress.toString() + "%",
                              color: theme.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 600,
                              letterSpacing: 0.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: FxSpacing.all(8),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onPrimary,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
