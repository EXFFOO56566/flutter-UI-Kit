/*
* File : Music Podcast
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class MusicPodcastScreen extends StatefulWidget {
  @override
  _MusicPodcastScreenState createState() => _MusicPodcastScreenState();
}

class _MusicPodcastScreenState extends State<MusicPodcastScreen> {
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
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
      children: <Widget>[
        Container(
          child: Center(
            child: FxText.titleMedium("Podcast",
                fontWeight: 600, letterSpacing: 0.2),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.titleMedium("Recent Shows",
                  fontWeight: 600, letterSpacing: 0),
              FxText.bodyMedium("View All",
                  color: theme.colorScheme.primary, fontWeight: 500)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 8, left: 8, top: 8),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-1.jpg',
                text: "UX",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-2.jpg',
                text: "Corona",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-3.jpg',
                text: "Design Studio",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-4.jpg',
                text: "From Temple",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.titleMedium("Popular Shows",
                  fontWeight: 700, letterSpacing: 0),
              FxText.bodyMedium("View All",
                  color: theme.colorScheme.primary, fontWeight: 500)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-1.jpg',
                text: "UX",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-2.jpg',
                text: "Corona",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-3.jpg',
                text: "Design Studio",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
              _SingleShowWidget(
                image: './assets/images/apps/music/podcast-4.jpg',
                text: "From Temple",
                height: MediaQuery.of(context).size.width * 0.5 - 30,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class _SingleShowWidget extends StatelessWidget {
  final String image, text;
  final double? height, radius;

  const _SingleShowWidget(
      {Key? key,
      required this.image,
      required this.text,
      required this.height,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(4),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: height,
                width: height,
              )),
          Container(
              margin: EdgeInsets.only(top: 4),
              child:
                  FxText.bodyMedium(text, letterSpacing: 0.2, fontWeight: 500))
        ],
      ),
    );
  }
}
