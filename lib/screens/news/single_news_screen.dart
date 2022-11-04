import 'package:flutkit/screens/news/news_editor_profile_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SingleNewsScreen extends StatefulWidget {
  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
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
        body: Padding(
      padding: FxSpacing.all(24),
      child: Column(
        children: <Widget>[
          Container(
            margin: FxSpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: customTheme.card,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: customTheme.shadowColor,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 4))
                        ]),
                    padding: FxSpacing.all(12),
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: theme.colorScheme.onBackground,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: customTheme.shadowColor,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4))
                      ]),
                  padding: FxSpacing.all(12),
                  child: Icon(
                    MdiIcons.bookmarkOutline,
                    color: theme.colorScheme.onBackground,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView(
            padding: FxSpacing.fromLTRB(0, 16, 0, 16),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: customTheme.card,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: customTheme.shadowColor.withAlpha(120),
                          blurRadius: 24,
                          spreadRadius: 4)
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Image(
                        image: AssetImage('./assets/images/all/all-l2.jpg'),
                      ),
                    ),
                    Container(
                      padding: FxSpacing.all(16),
                      child: Column(
                        children: [
                          Container(
                            child: FxText.titleLarge(
                                "14 Passengers Banned By Nona Airlines After bad Behaviour",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsEditorProfileScreen()));
                            },
                            child: Container(
                              margin: FxSpacing.top(16),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    child: Image(
                                      image: AssetImage(
                                          './assets/images/profile/avatar_2.jpg'),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  FxText.bodySmall("John smith",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      xMuted: true),
                                  Expanded(child: Container()),
                                  FxText.bodySmall("10 Jan, 2020",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: FxText(Generator.getParagraphsText(
                    paragraph: 4,
                    words: 30,
                    noOfNewLine: 2,
                    withHyphen: false)),
              ),
            ],
          )),
          Container(
            decoration: BoxDecoration(
                color: customTheme.card,
                boxShadow: [
                  BoxShadow(
                      color: customTheme.shadowColor,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: FxSpacing.fromLTRB(16, 4, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Write a comment"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary.withAlpha(60)),
                  padding: FxSpacing.all(8),
                  child: Icon(
                    MdiIcons.sendOutline,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
