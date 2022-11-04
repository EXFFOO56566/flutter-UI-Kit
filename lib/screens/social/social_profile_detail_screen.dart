import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import 'social_relationship_screen.dart';

class SocialProfileDetailScreen extends StatefulWidget {
  @override
  _SocialProfileDetailScreenState createState() =>
      _SocialProfileDetailScreenState();
}

class _SocialProfileDetailScreenState extends State<SocialProfileDetailScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    int size = 11;
    for (int i = 0; i < size; i++) {
      list.add(Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    list.add(InkWell(
      splashColor: theme.colorScheme.primary.withAlpha(100),
      highlightColor: theme.colorScheme.primary.withAlpha(28),
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(28),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: FxText.titleSmall("View All",
              color: theme.colorScheme.primary, fontWeight: 600),
        ),
      ),
    ));
    return list;
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
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: [
            Container(
              margin: FxSpacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image(
                        image:
                            AssetImage('./assets/images/profile/avatar_3.jpg'),
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  Container(
                    margin: FxSpacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: FxText.bodyLarge("Jedd Kouma",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0,
                              fontWeight: 600),
                        ),
                        Container(
                          child: FxText.bodyMedium("April 12th",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0,
                              muted: true),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  Container(
                    child: FxButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SocialRelationshipScreen()));
                      },
                      elevation: 0,
                      borderRadiusAll: 4,
                      child: FxText.bodyMedium("Connect",
                          fontWeight: 500, color: theme.colorScheme.onPrimary),
                    ),
                  ),
                  Container(
                    margin: FxSpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.titleSmall("105k",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodySmall("Followers",
                            color: theme.colorScheme.onBackground, muted: true),
                      ],
                    ),
                  ),
                  Container(
                    margin: FxSpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.titleSmall("45",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                        FxText.bodySmall("Following",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 0, 0),
              child: FxText.titleMedium("Posts",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: FxSpacing.fromLTRB(24, 12, 24, 24),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: _generateGridItems()),
            )
          ],
        ));
  }
}
