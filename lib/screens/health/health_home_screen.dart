import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'health_new_activity_screen.dart';

class HealthHomeScreen extends StatefulWidget {
  @override
  _HealthHomeScreenState createState() => _HealthHomeScreenState();
}

class _HealthHomeScreenState extends State<HealthHomeScreen> {
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
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: theme.colorScheme.primary,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthNewActivityScreen()));
            },
            label: Row(
              children: [
                Icon(
                  MdiIcons.plus,
                  color: theme.colorScheme.onPrimary,
                  size: 18,
                ),
                Container(
                  margin: FxSpacing.left(4),
                  child: FxText.bodyMedium("Activity",
                      color: theme.colorScheme.onPrimary, fontWeight: 500),
                ),
              ],
            )),
        body: ListView(
          padding: FxSpacing.top(48),
          children: [
            Container(
              margin: FxSpacing.fromLTRB(24, 0, 24, 0),
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_1.jpg'),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 0, 0),
              child: FxText.titleMedium("Hello",
                  xMuted: true, color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: FxSpacing.left(24),
              child: FxText.headlineMedium("Den!",
                  letterSpacing: -0.5,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 700),
            ),
            FxContainer(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              padding: FxSpacing.horizontal(12),
              borderRadiusAll: 4,
              child: Row(
                children: [
                  Icon(
                    MdiIcons.magnify,
                    color: theme.colorScheme.primary.withAlpha(200),
                    size: 16,
                  ),
                  Expanded(
                    child: Container(
                      margin: FxSpacing.left(12),
                      child: TextFormField(
                        style: FxTextStyle.bodySmall(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          fillColor: customTheme.card,
                          hintStyle: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 500),
                          hintText: "Find Events...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 36, 24, 0),
              padding: FxSpacing.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.bodyLarge("Stay Home!",
                          color: theme.colorScheme.onPrimary, fontWeight: 600),
                      Icon(
                        MdiIcons.close,
                        color: theme.colorScheme.onPrimary.withAlpha(200),
                        size: 16,
                      )
                    ],
                  ),
                  Container(
                    margin: FxSpacing.top(8),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: FxText.bodyMedium(Generator.getDummyText(12),
                        color: theme.colorScheme.onPrimary,
                        fontWeight: 400,
                        muted: true),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: FxText.titleMedium("How we can help you?",
                  letterSpacing: -0.15,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  muted: true),
            ),
            Container(
              margin: FxSpacing.top(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleHelpWidget(iconData: MdiIcons.doctor, title: "Doctor"),
                  singleHelpWidget(
                      iconData: MdiIcons.hospitalBuilding, title: "Hospital"),
                  singleHelpWidget(iconData: MdiIcons.pill, title: "Medicine")
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleHelpWidget(
                      iconData: MdiIcons.ambulance, title: "Ambulance"),
                  singleHelpWidget(
                      iconData: MdiIcons.phonePlus, title: "Consultation"),
                  singleHelpWidget(iconData: MdiIcons.needle, title: "Shots")
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleHelpWidget(
      {IconData? iconData, required String title, Color? color}) {
    return FxContainer(
      width: (MediaQuery.of(context).size.width - 96) / 3,
      padding: FxSpacing.fromLTRB(0, 20, 0, 20),
      borderRadiusAll: 4,
      child: Column(
        children: [
          Icon(
            iconData,
            color: color == null ? theme.colorScheme.primary : color,
            size: 30,
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.bodySmall(title,
                letterSpacing: 0,
                color: theme.colorScheme.onBackground,
                fontWeight: 600),
          )
        ],
      ),
    );
  }
}
