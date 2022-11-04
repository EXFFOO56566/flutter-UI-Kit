/*
* File : Full Page News Card
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      elevation: 2,
      margin: FxSpacing.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image(
              image: AssetImage(Images.portraits[0]),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: FxSpacing.fromLTRB(24, 24, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(
                      "March 20, 2020",
                      fontWeight: 700,
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: FxText.titleLarge("What happened At CUBA?",
                          fontWeight: 700),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: FxText.bodyMedium(_newsContent,
                          fontWeight: 500, height: 1.2),
                    ),
                    Container(
                      margin: FxSpacing.top(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: FxSpacing.left(16),
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                size: 20,
                              )),
                          Container(
                            margin: FxSpacing.left(8),
                            child: FxText.bodySmall("220".toString(),
                                fontWeight: 600, letterSpacing: 0.3),
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.height(16),
                    Container(
                      child: Center(
                        child: FxButton(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {},
                          child: FxText.bodyMedium("READ MORE",
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
