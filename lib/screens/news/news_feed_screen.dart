import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'single_news_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
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
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          Container(
            child: FxText.titleSmall("Good morning",
                color: theme.colorScheme.onBackground,
                fontWeight: 600,
                xMuted: true),
          ),
          Container(
            child: FxText.headlineMedium("Denish",
                color: theme.colorScheme.onBackground, fontWeight: 600),
          ),
          Container(
            margin: FxSpacing.top(24),
            child: FxText.bodyMedium("Your daily read ",
                color: theme.colorScheme.onBackground,
                fontWeight: 600,
                muted: true),
          ),
          _singleNews(
              image: './assets/images/all/all-1.jpg',
              topic: "Business",
              author: "Johnnie N. Krug",
              date: "Jan 10, 2021",
              headline: "Tesla faces bumpier ride breaking into India",
              timeToRead: "5 min read"),
          _singleNews(
              image: './assets/images/all/all-2.jpg',
              topic: "Science",
              author: "Emily G. Trice",
              date: "Dec 23, 2020",
              headline:
                  "Joe Biden Plans Day One Orders To Reverse Trump Decisions.",
              timeToRead: "2 min read"),
          _singleNews(
              image: './assets/images/all/all-3.jpg',
              topic: "Politics",
              author: "Jennifer S. Smith",
              date: "Nov 6, 2020",
              headline: "Here's What's Keeping JasminAfter Bigg Boss 14",
              timeToRead: "10 min read"),
          _singleNews(
              image: './assets/images/all/all-4.jpg',
              topic: "Food",
              author: "Selena M. Waters",
              date: "March 12, 2020",
              headline: "Hunar Haat In Lucknow: When, Where, How Items",
              timeToRead: "3 min read"),
          _singleNews(
              image: './assets/images/all/all-5.jpg',
              topic: "Lifestyle",
              author: "Briana G. Holland",
              date: "April 31, 2020",
              headline: "5 Common Myths About Thyroid Disease Believing",
              timeToRead: "5 min read"),
        ],
      )),
    );
  }

  _singleNews(
      {required String image,
      required String topic,
      required String headline,
      required String author,
      required String date,
      required String timeToRead}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleNewsScreen()));
      },
      child: Container(
        margin: FxSpacing.top(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(topic,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true),
                  SizedBox(
                    height: 4,
                  ),
                  FxText.bodyLarge(headline,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  SizedBox(
                    height: 8,
                  ),
                  FxText.titleSmall(author,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Row(
                    children: [
                      Expanded(
                          child: FxText.bodyMedium(date,
                              color: theme.colorScheme.onBackground,
                              fontSize: 11,
                              xMuted: true)),
                      Container(
                        decoration: BoxDecoration(
                            color:
                                theme.colorScheme.onBackground.withAlpha(100),
                            shape: BoxShape.circle),
                        width: 4,
                        height: 4,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          child: FxText.bodyMedium(timeToRead,
                              color: theme.colorScheme.onBackground,
                              xMuted: true)),
                      SizedBox(
                        width: 11,
                      ),
                      Icon(
                        MdiIcons.bookmark,
                        color: theme.colorScheme.primary,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
