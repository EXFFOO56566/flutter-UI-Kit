import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'social_post_screen.dart';
import 'social_profile_screen.dart';
import 'social_status_screen.dart';

class SocialHomeScreen extends StatefulWidget {
  @override
  _SocialHomeScreenState createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _simpleChoice = [
    "Report",
    "Turn on notification",
    "Copy Link",
    "Share to ...",
    "Unfollow",
    "Mute"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          FxSpacing.fromLTRB(0, FxSpacing.safeAreaTop(context) + 20, 0, 16),
      children: [
        Container(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: FxSpacing.fromLTRB(16, 0, 6, 0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/profile/avatar_4.jpg'),
                          height: 52,
                          width: 52,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        right: -1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: customTheme.card, width: 1.4),
                              shape: BoxShape.circle),
                          child: Container(
                            padding: FxSpacing.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primary,
                            ),
                            child: Icon(
                              MdiIcons.plus,
                              size: 12,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                statusWidget(
                    image: './assets/images/profile/avatar_3.jpg',
                    type: 2,
                    isLive: true),
                statusWidget(
                    image: './assets/images/profile/avatar_1.jpg', type: 1),
                statusWidget(
                    image: './assets/images/profile/avatar_2.jpg', type: 1),
                statusWidget(
                    image: './assets/images/profile/avatar_5.jpg', type: 2),
                statusWidget(
                    image: './assets/images/profile/avatar.jpg',
                    type: 2,
                    isMuted: true),
                statusWidget(
                    image: './assets/images/profile/avatar_3.jpg',
                    type: 2,
                    isMuted: true),
              ],
            ),
          ),
        ),
        Container(
          margin: FxSpacing.top(8),
          child: Divider(
            height: 0,
          ),
        ),
        Container(
          child: Column(
            children: [
              postWidget(
                  profileImage: './assets/images/profile/avatar_2.jpg',
                  name: "Arnold Wilcox",
                  status: "Surat, Gujarat",
                  postImage: './assets/images/profile/profile-banner.jpg',
                  likes: "21 Like this",
                  time: '12 min'),
              Divider(
                height: 0,
              ),
              postWidget(
                  profileImage: './assets/brand/google.png',
                  name: "Google",
                  status: "Sponsored",
                  postImage: './assets/images/apps/social/post-1.jpg',
                  likes: "You and 7M others Like this",
                  time: 'Yesterday'),
              Divider(
                height: 0,
              ),
              postWidget(
                  profileImage: './assets/images/profile/avatar_3.jpg',
                  name: "Gordon Hays",
                  status: "Ahmedabad, Gujarat",
                  postImage: './assets/images/apps/social/post-l1.jpg',
                  likes: "You and 98 others Like this",
                  time: 'Yesterday'),
              Divider(
                height: 0,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 16,
          ),
          child: Center(
            child: Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                  strokeWidth: 1.4),
            ),
          ),
        )
      ],
    ));
  }

  Widget statusWidget(
      {required String image,
      int type = 1,
      bool isLive = false,
      bool isMuted = false}) {
    return Opacity(
      opacity: isMuted ? 0.4 : 1,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialStatusScreen()));
        },
        child: Container(
          padding: FxSpacing.horizontal(6),
          child: Stack(
            children: [
              Container(
                padding: FxSpacing.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: type == 2 ? customTheme.border : Colors.red,
                        width: 1.6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  child: Image(
                    image: AssetImage(image),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isLive
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: FxSpacing.fromLTRB(4, 2, 4, 2),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: FxText.bodySmall("Live",
                            color: Colors.white, fontSize: 9),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget postWidget(
      {required String profileImage,
      required String name,
      required String status,
      required String postImage,
      required String likes,
      String? comments,
      required String time}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SocialPostScreen()));
      },
      child: Container(
        margin: FxSpacing.fromLTRB(0, 12, 0, 16),
        child: Column(
          children: [
            Container(
              margin: FxSpacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialProfileScreen()));
                    },
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Image(
                            image: AssetImage(profileImage),
                            width: 32,
                            height: 32,
                          )),
                    ),
                  ),
                  Container(
                    margin: FxSpacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodySmall(name,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        FxText.bodySmall(status,
                            fontSize: 12,
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: FxText.bodySmall(
                          time,
                          color: theme.colorScheme.onBackground,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(12),
              child: Image(
                image: AssetImage(
                  postImage,
                ),
                height: 240,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Generator.buildOverlaysProfile(
                      images: [
                        './assets/images/profile/avatar_3.jpg',
                        './assets/images/profile/avatar_5.jpg',
                        './assets/images/profile/avatar_2.jpg',
                      ],
                      enabledOverlayBorder: true,
                      overlayBorderColor: customTheme.card,
                      overlayBorderThickness: 1.7,
                      leftFraction: 0.72,
                      size: 24),
                  Container(
                    margin: FxSpacing.left(4),
                    child: FxText.bodySmall(likes,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return _simpleChoice.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              height: 36,
                              child: FxText.bodyMedium(choice,
                                  color: theme.colorScheme.onBackground),
                            );
                          }).toList();
                        },
                        icon: Icon(
                          MdiIcons.dotsVertical,
                          color: theme.colorScheme.onBackground,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FxText.bodyMedium("Nola Padilla",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 700),
                      Expanded(
                        child: Container(
                          margin: FxSpacing.left(8),
                          child: FxText.bodySmall(
                            Generator.getDummyText(5, withEmoji: true),
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: FxSpacing.top(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FxText.bodyMedium("Kristie Smith",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                        Expanded(
                          child: Container(
                            margin: FxSpacing.left(8),
                            child: FxText.bodySmall(
                              Generator.getDummyText(5, withEmoji: true),
                              color: theme.colorScheme.onBackground,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
