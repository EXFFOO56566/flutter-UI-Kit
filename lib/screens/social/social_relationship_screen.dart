import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class SocialRelationshipScreen extends StatefulWidget {
  @override
  _SocialRelationshipScreenState createState() =>
      _SocialRelationshipScreenState();
}

class _SocialRelationshipScreenState extends State<SocialRelationshipScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: FxText.headlineSmall("Choose Relationship",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Container(
            margin: FxSpacing.top(40),
            height: 476,
            child: Stack(
              children: [
                Positioned(
                    left: 42,
                    top: 0,
                    child: singleRelation(
                        background: Colors.pinkAccent,
                        text: "Family",
                        onBG: Colors.white)),
                Positioned(
                    top: 172,
                    left: 42,
                    child: singleRelation(
                        background: Colors.blue,
                        text: "Friend",
                        onBG: Colors.white)),
                Positioned(
                    top: 344,
                    left: 42,
                    child: singleRelation(
                        background: Colors.purpleAccent,
                        text: "Other",
                        onBG: Colors.white)),
                Positioned(
                    top: 86,
                    right: 42,
                    child: singleRelation(
                        background: Colors.teal,
                        text: "Close Friend",
                        onBG: Colors.white)),
                Positioned(
                    top: 264,
                    right: 42,
                    child: singleRelation(
                        background: Colors.orangeAccent,
                        text: "Best",
                        onBG: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleRelation(
      {Color background = Colors.black,
      Color onBG = Colors.white,
      String text = "Text"}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 132,
        height: 132,
        decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: background.withAlpha(50),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0, 5)),
              BoxShadow(
                  color: background.withAlpha(60),
                  blurRadius: 16,
                  spreadRadius: 2,
                  offset: Offset(0, 5))
            ]),
        child: Center(
          child: FxText.titleMedium(text, color: onBG, fontWeight: 600),
        ),
      ),
    );
  }
}
