import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialSettingScreen extends StatefulWidget {
  @override
  _SocialSettingScreenState createState() => _SocialSettingScreenState();
}

class _SocialSettingScreenState extends State<SocialSettingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    desc = Generator.getDummyText(8);
  }

  late String desc;

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Row(
          children: [
            Container(
              padding: FxSpacing.fromLTRB(20, 8, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_4.jpg'),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Container()
          ],
        ),
        Container(
          padding: FxSpacing.fromLTRB(20, 16, 20, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleLarge("Martyn Rankin", fontWeight: 600),
                  Container(
                    margin: FxSpacing.top(4),
                    child: FxText.bodySmall(
                      "Fashion Model",
                    ),
                  ),
                  FxText.bodySmall(
                    "I love to be kind",
                  ),
                  FxText.bodySmall(
                    "From heaven",
                  ),
                  FxText.bodySmall("See more",
                      decoration: TextDecoration.underline),
                ],
              ),
              FxButton(
                  onPressed: () {},
                  borderRadiusAll: 4,
                  elevation: 0,
                  child: FxText.bodyMedium("Edit",
                      fontWeight: 600,
                      letterSpacing: 0.3,
                      color: theme.colorScheme.onPrimary))
            ],
          ),
        ),
        FxContainer.bordered(
          padding: FxSpacing.all(20),
          margin: FxSpacing.all(20),
          borderRadiusAll: 4,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FxText.titleMedium("15", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.titleSmall("Posts",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FxText.titleMedium("486", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.titleSmall("Followers",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FxText.titleMedium("58", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.titleSmall("Following",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.x(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.titleSmall("Complete your profile",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "2 OF 4 ",
                    style: FxTextStyle.bodySmall(
                        fontSize: 11,
                        fontWeight: 600,
                        color: customTheme.colorSuccess)),
                TextSpan(
                    text: " COMPLETE",
                    style: FxTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground,
                        xMuted: true,
                        fontSize: 11,
                        fontWeight: 600)),
              ]))
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: FxSpacing.left(20),
                  child: singleCompleteWidget(
                      iconData: MdiIcons.accountOutline,
                      option: "Add Photo",
                      title: "Add Profile Photo",
                      desc: desc),
                ),
                Container(
                  margin: FxSpacing.left(20),
                  child: singleCompleteWidget(
                      iconData: MdiIcons.chatOutline,
                      option: "Add Bio",
                      title: "Add Bio",
                      desc: desc),
                ),
                Container(
                  margin: FxSpacing.horizontal(20),
                  child: singleCompleteWidget(
                      iconData: MdiIcons.accountMultipleOutline,
                      option: "Find More",
                      title: "Find people",
                      desc: desc),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget singleCompleteWidget(
      {IconData? iconData,
      required String title,
      required String desc,
      required String option}) {
    return Container(
      padding: FxSpacing.fromLTRB(20, 20, 20, 16),
      width: 220,
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: customTheme.border, width: 1)),
      child: Column(
        children: [
          Container(
            padding: FxSpacing.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: theme.colorScheme.onBackground.withAlpha(120),
                    width: 1.5),
                shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onBackground.withAlpha(180),
              size: 26,
            ),
          ),
          Container(
            margin: FxSpacing.top(12),
            child: FxText.bodyMedium(title,
                color: theme.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0),
          ),
          Container(
            margin: FxSpacing.top(4),
            child: FxText.bodySmall(
              desc,
              color: theme.colorScheme.onBackground,
              fontWeight: 400,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
          ),
          FxSpacing.height(8),
          FxButton(
            borderRadiusAll: 4,
            elevation: 0,
            onPressed: () {},
            padding: FxSpacing.fromLTRB(12, 8, 12, 8),
            child: FxText.bodySmall(option,
                color: theme.colorScheme.onPrimary, fontWeight: 600),
          ),
        ],
      ),
    );
  }
}
