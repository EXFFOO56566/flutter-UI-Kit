import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventProfileScreen extends StatefulWidget {
  @override
  _EventProfileScreenState createState() => _EventProfileScreenState();
}

class _EventProfileScreenState extends State<EventProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    desc = Generator.getDummyText(8);
  }

  String? desc;

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          child: Column(
            children: [
              Container(
                padding: FxSpacing.fromLTRB(24, 8, 24, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_4.jpg'),
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.top(8),
                child: FxText.titleLarge("Martyn Rankin", fontWeight: 600),
              ),
            ],
          ),
        ),
        FxContainer.bordered(
          margin: FxSpacing.fromLTRB(24, 24, 24, 0),
          padding: FxSpacing.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FxText.bodySmall("My balance".toUpperCase(),
                      fontSize: 12, fontWeight: 600, xMuted: true),
                  FxText.bodyMedium("\$ 24", fontWeight: 600),
                ],
              ),
              FxContainer(
                padding: FxSpacing.fromLTRB(16, 8, 16, 8),
                color: theme.colorScheme.primary.withAlpha(28),
                borderRadiusAll: 4,
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.plus,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    Container(
                        margin: FxSpacing.left(8),
                        child: FxText.bodyMedium("Add Money",
                            color: theme.colorScheme.primary, fontWeight: 600))
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.bodySmall("INVITE",
                  fontSize: 11.5, fontWeight: 600, xMuted: true),
              Container(
                margin: FxSpacing.top(16),
                child: Row(
                  children: [
                    Container(
                      padding: FxSpacing.all(8),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(
                        MdiIcons.plus,
                        size: 22,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Container(
                      margin: FxSpacing.left(16),
                      child: FxText.bodyMedium("Add Friend",
                          color: theme.colorScheme.primary, fontWeight: 600),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_2.jpg',
                    name: "Walter Gale",
                    status: "Joined"),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_3.jpg',
                    name: "Tala Deacon",
                    status: "Joined"),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_4.jpg',
                    name: "Isha Cameron",
                    status: "Invite"),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget singleInvite(
      {required String image, required String name, required String status}) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 40,
                height: 40,
              )),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(name,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodySmall(
                    status,
                    fontWeight: 500,
                    muted: true,
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: FxSpacing.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(40),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: FxText.bodySmall("+ \$9",
                color: theme.colorScheme.primary,
                letterSpacing: 0.3,
                fontWeight: 700),
          )
        ],
      ),
    );
  }
}
