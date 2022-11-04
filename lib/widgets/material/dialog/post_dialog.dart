/*
* File : Image Post Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class PostDialog extends StatefulWidget {
  @override
  _PostDialogState createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _FullDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FxButton(
          onPressed: () {
            _showDialog();
          },
          elevation: 0,
          borderRadiusAll: 4,
          child: FxText.bodyMedium("View Post",
              fontWeight: 600,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.2)),
    ));
  }
}

class _FullDialog extends StatelessWidget {
  final String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.all(0),
        children: <Widget>[
          Stack(children: [
            Image(
              image: AssetImage(Images.portraits[0]),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Positioned(
                top: 24,
                left: 18,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(FeatherIcons.chevronLeft, color: Colors.white),
                )),
            Positioned(
              right: 16,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white.withAlpha(72),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                          side: BorderSide(width: 0)),
                      child: InkWell(
                        splashColor: Colors.white.withAlpha(100),
                        highlightColor: Colors.white.withAlpha(72),
                        child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 22,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  FxSpacing.width(8),
                  ClipOval(
                    child: Material(
                      color: Colors.white.withAlpha(72),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                          side: BorderSide(width: 0)),
                      child: InkWell(
                        splashColor: Colors.white.withAlpha(100),
                        highlightColor: Colors.white.withAlpha(72),
                        child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 22,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
          Container(
            padding: FxSpacing.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.headlineSmall("How do you get up and go forward",
                    fontWeight: 700),
                Container(
                    margin: FxSpacing.only(top: 8),
                    child: FxText.bodyMedium(description,
                        fontWeight: 500, height: 1.2)),
                Container(
                  margin: FxSpacing.top(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Images.profiles[0]),
                              fit: BoxFit.fill),
                        ),
                      ),
                      FxSpacing.width(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.titleMedium("Zakariyah Cline",
                                fontWeight: 600),
                            FxText.titleSmall("@zaka_cline", fontWeight: 500),
                          ],
                        ),
                      ),
                      FxText.bodyLarge("26 May", fontWeight: 600),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
