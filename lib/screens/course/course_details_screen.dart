import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  bool isFav = false, isBookmark = false;

  late String _descText;

  @override
  void initState() {
    super.initState();
    _descText = Generator.getDummyText(24, withTab: true);
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          padding: FxSpacing.fromLTRB(36, 48, 36, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: FxSpacing.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: customTheme.colorInfo,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: FxText.bodySmall("Trending",
                          color: customTheme.onInfo,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isFav = isFav;
                              });
                            },
                            child: Icon(
                              isFav ? MdiIcons.heart : MdiIcons.heartOutline,
                              color: theme.colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                        ),
                        Container(
                          margin: FxSpacing.left(24),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isBookmark = isBookmark;
                              });
                            },
                            child: Icon(
                              isBookmark
                                  ? MdiIcons.bookmark
                                  : MdiIcons.bookmarkOutline,
                              color: theme.colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(16),
                child: FxText.headlineSmall("UI Designing",
                    fontWeight: 700, color: theme.colorScheme.onPrimary),
              ),
              Container(
                margin: FxSpacing.top(8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.star,
                      size: 18,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Container(
                      margin: FxSpacing.left(4),
                      child: FxText.bodyMedium("4.7",
                          color: theme.colorScheme.onPrimary, fontWeight: 500),
                    ),
                    Container(
                      margin: FxSpacing.left(16),
                      child: Icon(
                        MdiIcons.accountMultiple,
                        size: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Container(
                      margin: FxSpacing.left(4),
                      child: FxText.bodyMedium("7k",
                          color: theme.colorScheme.onPrimary, fontWeight: 500),
                    ),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FxText.headlineSmall("\$50",
                        color: theme.colorScheme.onPrimary,
                        fontWeight: 600,
                        letterSpacing: 0.5,
                        height: 0),
                    Container(
                      margin: FxSpacing.left(8),
                      child: FxText.bodyMedium("\$70",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 500,
                          height: 0,
                          muted: true,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: FxSpacing.zero,
              children: <Widget>[
                Container(
                  padding: FxSpacing.fromLTRB(36, 24, 36, 0),
                  child: FxText.titleMedium("Description",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(36, 0, 36, 0),
                  margin: FxSpacing.top(16),
                  child: FxText.bodyMedium(_descText,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500,
                      letterSpacing: 0.3,
                      height: 1.4),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(36, 24, 36, 0),
                  child: FxText.titleMedium("Content",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(36, 16, 36, 0),
                  child: Column(
                    children: <Widget>[
                      singleContent(
                          title: "Welcome to the Course",
                          time: "4:15 mins",
                          index: "01"),
                      singleContent(
                          title: "UI - Intro", time: "8:30 mins", index: "02"),
                      singleContent(
                          title: "UI - Process",
                          time: "14:15 mins",
                          enabled: false,
                          index: "03"),
                      singleContent(
                          title: "UI - Finishing",
                          time: "2:45 mins",
                          enabled: false,
                          index: "04"),
                      singleContent(
                          title: "Exam",
                          time: "30:00 mins",
                          enabled: false,
                          index: "05"),
                    ],
                  ),
                ),
              ]),
        ),
        Container(
          decoration: BoxDecoration(
              color: customTheme.card,
              border: Border.all(color: customTheme.border),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          padding: FxSpacing.fromLTRB(36, 16, 36, 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FxButton(
                  onPressed: () {},
                  borderRadiusAll: 4,
                  elevation: 0,
                  child: FxText.bodyMedium("Buy Now",
                      fontWeight: 600, color: theme.colorScheme.onPrimary),
                ),
              ),
              Container(
                margin: FxSpacing.left(16),
                padding: FxSpacing.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(40),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Icon(
                  MdiIcons.shoppingOutline,
                  size: 24,
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget singleContent(
      {required String index,
      required String time,
      required String title,
      bool enabled = true}) {
    return Container(
      margin: FxSpacing.bottom(24),
      child: Row(
        children: <Widget>[
          FxText.headlineSmall(index,
              color: theme.colorScheme.onBackground.withAlpha(80),
              fontWeight: 600),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium(time,
                      color: theme.colorScheme.onBackground, muted: true),
                  FxText.titleMedium(
                    title,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: Container(
              margin: FxSpacing.left(16),
              padding: FxSpacing.all(8),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary, shape: BoxShape.circle),
              child: Icon(
                MdiIcons.play,
                color: theme.colorScheme.onPrimary,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
