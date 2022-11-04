import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialActivityScreen extends StatefulWidget {
  @override
  _SocialActivityScreenState createState() => _SocialActivityScreenState();
}

class _SocialActivityScreenState extends State<SocialActivityScreen> {
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
    return Scaffold(
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: FxSpacing.left(24),
          child: Row(
            children: [
              Container(
                padding: FxSpacing.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: theme.colorScheme.onBackground.withAlpha(140),
                        width: 1.5)),
                child: Icon(
                  MdiIcons.accountPlusOutline,
                  size: 24,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.titleSmall("Follow Requests",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0),
                    FxText.bodySmall("Approve or ignore request",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        muted: true),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: FxText.bodyLarge("Today",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            children: [
              Generator.buildOverlaysProfile(
                  images: [
                    './assets/images/profile/avatar_4.jpg',
                    './assets/images/profile/avatar_5.jpg',
                  ],
                  size: 40,
                  leftFraction: 0.25,
                  topFraction: 0.25,
                  enabledOverlayBorder: true,
                  overlayBorderThickness: 1.5,
                  overlayBorderColor: customTheme.card),
              Expanded(
                child: Container(
                  margin: FxSpacing.left(8),
                  child: RichText(
                    text: TextSpan(
                        style: FxTextStyle.bodyLarge(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        children: <TextSpan>[
                          TextSpan(
                              text: "amani.buchanan, layton_beck ",
                              style: FxTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600)),
                          TextSpan(
                              text: "and ",
                              style: FxTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                          TextSpan(
                              text: "5 others ",
                              style: FxTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600)),
                          TextSpan(
                              text: "started following you. ",
                              style: FxTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                          TextSpan(
                              text: " 2d",
                              style: FxTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  muted: true,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: FxText.bodyLarge("Recent",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              singleRecentWidget(
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Follow ",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "Leonardo Carty, Reilly Sadler ",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)),
                      TextSpan(
                          text:
                              "and others you know to see their photos and videos. ",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "5w",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                              fontWeight: 500)),
                    ]),
                  ),
                  image: './assets/images/profile/avatar_1.jpg'),
              singleRecentWidget(
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Irfan Alvarado, Halima Snider ",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)),
                      TextSpan(
                          text: "on Social. See their posts. ",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "10w",
                          style: FxTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                              fontWeight: 500)),
                    ]),
                  ),
                  image: './assets/images/profile/avatar_2.jpg'),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: FxText.bodyLarge("Suggestions",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              singleSuggestionWidget(
                  image: './assets/images/profile/avatar_2.jpg',
                  name: "Matt Hayden",
                  username: "matt_hayden",
                  status: "Suggested for you",
                  index: 0),
              singleSuggestionWidget(
                  image: './assets/images/profile/avatar_4.jpg',
                  name: "Merlin Roche",
                  username: "merlin@roch",
                  status: "Suggested for you",
                  index: 1),
              singleSuggestionWidget(
                  image: './assets/images/profile/avatar_5.jpg',
                  name: "Darren Carrillo",
                  username: "darren.car",
                  status: "Popular",
                  index: 2),
              singleSuggestionWidget(
                  image: './assets/images/profile/avatar_1.jpg',
                  name: "Lindsey Grey",
                  username: "lindsey",
                  status: "Popular",
                  index: 3),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleRecentWidget({required String image, RichText? text}) {
    return Container(
      margin: FxSpacing.top(16),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: Image(
                  image: AssetImage(image),
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: text,
            ),
          )
        ],
      ),
    );
  }

  Widget singleSuggestionWidget(
      {required String image,
      required String name,
      required String username,
      required String status,
      required int index}) {
    return Container(
      margin: FxSpacing.top(16),
      child: InkWell(
        onTap: () {
          //_showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: Image(
                image: AssetImage(image),
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(username,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600),
                    FxText.bodySmall(
                      name,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      xMuted: true,
                      fontWeight: 600,
                      fontSize: 12,
                    ),
                    FxText.bodySmall(
                      status,
                      fontSize: 12,
                      color: theme.colorScheme.onBackground,
                      muted: true,
                      letterSpacing: 0,
                      fontWeight: 500,
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
            ),
            Container(
              margin: FxSpacing.left(16),
              child: Icon(
                MdiIcons.close,
                size: 14,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
