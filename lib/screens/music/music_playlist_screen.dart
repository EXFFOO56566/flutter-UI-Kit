import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class MusicPlayListScreen extends StatefulWidget {
  @override
  _MusicPlayListScreenState createState() => _MusicPlayListScreenState();
}

class _MusicPlayListScreenState extends State<MusicPlayListScreen> {
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
      children: <Widget>[
        Container(
          child: Center(
            child: FxText.titleMedium("Playlist",
                fontWeight: 600, letterSpacing: 0.2),
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(20, 20, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _SinglePlaylistWidget(
                    image: './assets/images/apps/music/all-1.jpg',
                    title: 'Travel'),
                _SinglePlaylistWidget(
                    image: './assets/images/apps/music/all-2.jpg',
                    title: 'Albums'),
                _SinglePlaylistWidget(
                    image: './assets/images/apps/music/singer-3.jpg',
                    title: 'Favourite'),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: _SinglePlaylistWidget(
                      image: './assets/images/apps/music/singer-4.jpg',
                      title: 'Old'),
                ),
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: FxText.bodyLarge("All Tracks", fontWeight: 600)),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              _SingleTrackWidget(
                  image: './assets/images/apps/music/event-1.jpg',
                  name: 'What\'s My Name',
                  album: 'Album - 1',
                  duration: '4:20'),
              _SingleTrackWidget(
                  image: './assets/images/apps/music/event-2.jpg',
                  name: 'What\'s My Name',
                  album: 'Album - 1',
                  duration: '5:40'),
              _SingleTrackWidget(
                  image: './assets/images/apps/music/event-3.jpg',
                  name: 'What\'s My Name',
                  album: 'Album - 1',
                  duration: '3:34'),
              _SingleTrackWidget(
                  image: './assets/images/apps/music/singer-4.jpg',
                  name: 'What\'s My Name',
                  album: 'Album - 1',
                  duration: '2:43'),
            ],
          ),
        )
      ],
    ));
  }
}

class _SinglePlaylistWidget extends StatelessWidget {
  final String image, title;

  const _SinglePlaylistWidget(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxContainer(
      margin: FxSpacing.right(20),
      borderRadiusAll: 4,
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child:
                FxText.bodyMedium(title, fontWeight: 600, letterSpacing: 0.2),
          )
        ],
      ),
    );
  }
}

class _SingleTrackWidget extends StatelessWidget {
  final String image, name, album, duration;

  const _SingleTrackWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.album,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: 56,
                width: 56,
              )),
          FxSpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.titleSmall(name, fontWeight: 600, letterSpacing: 0.2),
                FxText.bodyMedium(album,
                    color: theme.colorScheme.onBackground, letterSpacing: 0.10)
              ],
            ),
          ),
          Container(
            child:
                FxText.bodyLarge(duration, fontWeight: 600, letterSpacing: 0.2),
          ),
        ],
      ),
    );
  }
}

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final Color backgroundColor, iconColor;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      required this.backgroundColor,
      required this.iconColor})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        elevation: 5,
        color: widget.backgroundColor,
        child: InkWell(
          child: IconButton(
            iconSize: 28,
            icon: AnimatedIcon(
              icon: widget.animatedIconData,
              progress: _animationController,
              color: widget.iconColor,
            ),
            onPressed: () {
              if (isPlaying) {
                _animationController.reverse();
                setState(() {
                  isPlaying = false;
                });
              } else {
                _animationController.forward();
                setState(() {
                  isPlaying = true;
                });
              }
            },
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
