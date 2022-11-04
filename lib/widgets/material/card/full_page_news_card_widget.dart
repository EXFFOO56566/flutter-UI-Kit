/*
* File : Full Page News Card
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FullPageNewsCardWidget extends StatefulWidget {
  @override
  _FullPageNewsCardWidgetState createState() => _FullPageNewsCardWidgetState();
}

class _FullPageNewsCardWidgetState extends State<FullPageNewsCardWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("News", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage('./assets/images/all/all-p3.jpg'),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 24, right: 24, top: 24, bottom: 8),
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
                              margin: EdgeInsets.only(top: 16),
                              child: FxText.titleLarge("What happened At CUBA?",
                                  fontWeight: 700),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: FxText.bodyMedium(_newsContent,
                                  fontWeight: 500, height: 1.2),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: Icon(
                                        MdiIcons.eye,
                                        color: theme.colorScheme.onBackground
                                            .withAlpha(200),
                                        size: 20,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: FxText.bodySmall("220".toString(),
                                        fontWeight: 600, letterSpacing: 0.3),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FxButton(
                                    elevation: 0,
                                    borderRadiusAll: 4,
                                    onPressed: () {},
                                    child: FxText.bodyMedium("READ MORE",
                                        fontWeight: 600,
                                        color: theme.colorScheme.onPrimary)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
