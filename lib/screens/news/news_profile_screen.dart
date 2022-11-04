import 'package:flutkit/screens/profile/edit_profile_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewsProfileScreen extends StatefulWidget {
  @override
  _NewsProfileScreenState createState() => _NewsProfileScreenState();
}

class _NewsProfileScreenState extends State<NewsProfileScreen> {
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
        body: ListView(
      padding:
          FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
      children: <Widget>[
        _upgradeWidget(),
        Container(
          margin: FxSpacing.top(20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: theme.colorScheme.primary),
                padding: FxSpacing.all(10),
                child: Icon(
                  MdiIcons.tuneVariant,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium("Account",
                      color: theme.colorScheme.onBackground, fontWeight: 700),
                  FxText.labelSmall("Edit and manage your account details",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)
                ],
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(20),
          padding: FxSpacing.vertical(8),
          decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()));
                },
                leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      height: 44,
                      width: 44,
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.titleSmall("Maria M. Boyles",
                        color: theme.colorScheme.onBackground, fontWeight: 700),
                    FxText.bodyMedium("Editor",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        muted: true,
                        fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyMedium("Email",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        xMuted: true,
                        fontWeight: 600),
                    FxText.titleSmall("maria@coderthemes.com",
                        color: theme.colorScheme.onBackground, fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyMedium("Phone",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        xMuted: true,
                        fontWeight: 600),
                    FxText.titleSmall("+91 98765 43210",
                        color: theme.colorScheme.onBackground, fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: theme.colorScheme.primary),
                padding: FxSpacing.all(10),
                child: Icon(
                  MdiIcons.emailOpenOutline,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium("Help and Feedback",
                      color: theme.colorScheme.onBackground, fontWeight: 700),
                  FxText.labelSmall("Reach us with your feedback and questions",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)
                ],
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(20),
          padding: FxSpacing.vertical(8),
          decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  MdiIcons.frequentlyAskedQuestions,
                  color: theme.colorScheme.onBackground,
                ),
                title: FxText.bodyLarge("FAQs",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  MdiIcons.youtube,
                  color: theme.colorScheme.onBackground,
                ),
                title: FxText.bodyLarge("Videos",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  MdiIcons.emailOutline,
                  color: theme.colorScheme.onBackground,
                ),
                title: FxText.bodyLarge("Contact us",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _upgradeWidget() {
    return Container(
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: customTheme.border, width: 1)),
      padding: FxSpacing.all(20),
      child: Column(
        children: [
          FxText.bodyLarge("Become Pro",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          FxText.bodyMedium("Get more done with pro",
              color: theme.colorScheme.onBackground, fontWeight: 500),
          Container(
            margin: FxSpacing.top(8),
            padding: FxSpacing.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: theme.colorScheme.primary),
            child: FxText.bodySmall("Upgrade now",
                color: theme.colorScheme.onPrimary,
                fontWeight: 600,
                letterSpacing: 0.3),
          )
        ],
      ),
    );
  }
}
