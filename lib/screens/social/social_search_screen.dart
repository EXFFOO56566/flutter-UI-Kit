import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'social_profile_screen.dart';

class SocialSearchScreen extends StatefulWidget {
  @override
  _SocialSearchScreenState createState() => _SocialSearchScreenState();
}

class _SocialSearchScreenState extends State<SocialSearchScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _list = List.generate(6, (index) => false);
  }

  late List<bool> _list;

  Widget build(BuildContext context) {
    return ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: TextFormField(
            style: FxTextStyle.bodyMedium(
                letterSpacing: 0,
                color: theme.colorScheme.onBackground,
                fontWeight: 500),
            decoration: InputDecoration(
                hintText: "Search messages",
                hintStyle: FxTextStyle.bodyMedium(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                fillColor: customTheme.card,
                filled: true,
                isDense: true,
                prefixIcon: Icon(
                  MdiIcons.magnify,
                  size: 16,
                  color: theme.colorScheme.onBackground.withAlpha(220),
                )),
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.bodyMedium("Recent",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
              FxText.bodyMedium("Clear",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(0, 12, 0, 0),
          child: Row(
            children: [
              Container(
                margin: FxSpacing.left(24),
                child: searchRecentItem(
                  image: './assets/images/profile/avatar_1.jpg',
                  name: 'Andrei',
                  isActive: true,
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: searchRecentItem(
                  image: './assets/images/profile/avatar_2.jpg',
                  name: 'Ratcliffe',
                  isActive: true,
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: searchRecentItem(
                  image: './assets/images/profile/avatar_3.jpg',
                  name: 'Cade',
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(16, 0, 24, 0),
                child: searchRecentItem(
                  image: './assets/images/profile/avatar_4.jpg',
                  name: 'Hussein',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: FxText.bodyMedium("Result",
              color: theme.colorScheme.onBackground, fontWeight: 700),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              searchResultItem(
                  index: 4,
                  image: './assets/images/profile/avatar_5.jpg',
                  name: 'Lowri Gould',
                  status: "@lowri12"),
              searchResultItem(
                  index: 5,
                  image: './assets/images/profile/avatar.jpg',
                  name: 'Samson Bains',
                  isActive: true,
                  status: "@samson_bains"),
              searchResultItem(
                  index: 0,
                  image: './assets/images/profile/avatar_2.jpg',
                  isActive: true,
                  name: 'Reanne Dudley',
                  status: "@reanne45"),
              searchResultItem(
                  index: 1,
                  image: './assets/images/profile/avatar_1.jpg',
                  name: 'Calista Garcia',
                  status: "@calista"),
              searchResultItem(
                  index: 2,
                  image: './assets/images/profile/avatar_3.jpg',
                  name: 'Samson Bains',
                  status: "@samson_56"),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchResultItem(
      {required String image,
      required int index,
      required String name,
      required String status,
      bool isActive = false}) {
    return Container(
      margin: FxSpacing.top(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialProfileScreen()));
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Image(
                    image: AssetImage(image),
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: customTheme.card, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: customTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyLarge(name,
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    FxText.bodySmall(
                      status,
                      fontSize: 12,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                      fontWeight: 600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: FxContainer(
                padding: FxSpacing.fromLTRB(16, 8, 16, 8),
                bordered: _list[index],
                borderRadiusAll: 4,
                border: Border.all(color: customTheme.border, width: 1),
                color: _list[index]
                    ? Colors.transparent
                    : theme.colorScheme.primary,
                child: FxText.bodySmall(_list[index] ? "Following" : "Follow",
                    color: _list[index]
                        ? theme.colorScheme.onBackground
                        : theme.colorScheme.onPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.3),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchRecentItem(
      {required String image, required String name, bool isActive = false}) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialProfileScreen()));
        },
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Image(
                    image: AssetImage(image),
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: customTheme.card, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: customTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Container(
              margin: FxSpacing.top(8),
              child: FxText.bodySmall(name,
                  letterSpacing: 0,
                  color: theme.colorScheme.onBackground,
                  muted: true,
                  fontWeight: 500),
            )
          ],
        ),
      ),
    );
  }
}
