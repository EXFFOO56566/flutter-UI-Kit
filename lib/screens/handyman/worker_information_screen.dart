import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'book_service_screen.dart';

class WorkerInformationScreen extends StatefulWidget {
  @override
  _WorkerInformationScreenState createState() =>
      _WorkerInformationScreenState();
}

class _WorkerInformationScreenState extends State<WorkerInformationScreen> {
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
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleLarge("Sid Moore",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.left(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodySmall("How far",
                          color: theme.colorScheme.onBackground, xMuted: true),
                      FxText.bodyLarge("3.2 km",
                          color: theme.colorScheme.onBackground),
                      Container(
                        margin: FxSpacing.top(8),
                        child: FxText.bodySmall("Charges per hour",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                      ),
                      FxText.bodyLarge("\$ 19",
                          color: theme.colorScheme.onBackground),
                      Container(
                        margin: FxSpacing.top(8),
                        child: FxText.bodySmall("Rating",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.star,
                            color: Generator.starColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          FxText.bodyMedium("4.5",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodyLarge("Sid Moore",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      FxText.bodyMedium("Plumber",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          xMuted: true),
                    ],
                  ),
                  Row(
                    children: [
                      FxContainer.roundBordered(
                          color: Colors.transparent,
                          border: Border.all(color: theme.colorScheme.primary),
                          paddingAll: 10,
                          child: Center(
                            child: Icon(
                              FeatherIcons.phone,
                              color: theme.colorScheme.primary,
                              size: 14,
                            ),
                          )),
                      Container(
                        margin: FxSpacing.left(12),
                        child: FxContainer.roundBordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            paddingAll: 10,
                            child: Center(
                              child: Icon(
                                FeatherIcons.mail,
                                color: theme.colorScheme.primary,
                                size: 14,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: FxText.bodyMedium(
                "About",
                color: theme.colorScheme.primary,
                fontWeight: 600,
              ),
            ),
            Container(
              margin: FxSpacing.top(8),
              child: FxText.bodyMedium(
                  Generator.getParagraphsText(
                      paragraph: 3, words: 20, noOfNewLine: 1),
                  color: theme.colorScheme.onBackground,
                  muted: true),
            ),
            Container(
              margin: FxSpacing.top(24),
              child: FxButton(
                elevation: 0,
                padding: FxSpacing.y(12),
                borderRadiusAll: 4,
                splashColor: theme.colorScheme.onPrimary.withAlpha(20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookServiceScreen()));
                },
                child: FxText.bodySmall("BOOK NOW",
                    letterSpacing: 0.4,
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary),
              ),
            )
          ],
        ));
  }
}
