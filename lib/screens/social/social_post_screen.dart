import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialPostScreen extends StatefulWidget {
  @override
  _SocialPostScreenState createState() => _SocialPostScreenState();
}

class _SocialPostScreenState extends State<SocialPostScreen> {
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
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: FxSpacing.fromLTRB(16, 0, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      width: 32,
                      height: 32,
                    )),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodySmall("Charlize Avila",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    FxText.bodySmall("Surat, Gujarat",
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
                    "12 min",
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(12),
          child: Image(
            image: AssetImage(
              './assets/images/apps/social/post-1.jpg',
            ),
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 12, 24, 0),
          child: Row(
            children: [
              Container(
                child: Icon(
                  MdiIcons.heartOutline,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: Icon(MdiIcons.commentOutline,
                    size: 20,
                    color: theme.colorScheme.onBackground.withAlpha(200)),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: Icon(
                  MdiIcons.shareOutline,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: FxText.bodySmall("7,327 views",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 12, 24, 0),
          child: FxText.bodySmall(
              Generator.getParagraphsText(
                  withEmoji: true,
                  paragraph: 2,
                  words: 18,
                  noOfNewLine: 1,
                  withHyphen: true),
              color: theme.colorScheme.onBackground),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 8, 24, 0),
          child: FxText.bodySmall("View all 28 comments",
              color: theme.colorScheme.onBackground,
              xMuted: true,
              letterSpacing: -0.2),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: FxTextStyle.bodyMedium(
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500,
                      fontSize: 12),
                  decoration: InputDecoration(
                      fillColor: customTheme.card,
                      hintStyle: FxTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          muted: true,
                          letterSpacing: 0,
                          fontSize: 12),
                      filled: true,
                      hintText: "Comment me",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      isDense: true,
                      contentPadding: FxSpacing.all(12)),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                child: FxText.bodySmall("Post",
                    color: theme.colorScheme.primary.withAlpha(200),
                    fontWeight: 500),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
