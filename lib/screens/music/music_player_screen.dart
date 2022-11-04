/*
* File : Music Player
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  Timer? _timer;
  int _duration = 200, repeatType = 0;
  int _position = 0;
  String _time = "0:00";

  convertTime() {
    int hour = (_position / 3600).floor();
    int minute = ((_position - 3600 * hour) / 60).floor();
    int second = (_position - 3600 * hour - 60 * minute);
    String time = "";
    if (second < 10) {
      time += minute.toString() + ":0" + second.toString();
    } else {
      time += minute.toString() + ":" + second.toString();
    }

    setState(() {
      _time = time;
    });
  }

  _onTrackDurationChange(double value) {
    setState(() {
      _position = value.floor();
    });
    convertTime();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_position >= (_duration - 1)) {
            timer.cancel();
            _position += 1;
            convertTime();
            isPlaying = false;
            _animationController.reverse();
          } else {
            _position += 1;
            convertTime();
          }
        },
      ),
    );
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  _onPlay() {
    startTimer();
  }

  _onPause() {
    _timer!.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          centerTitle: true,
          title: FxText.titleLarge("Player", fontWeight: 600),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                './assets/images/apps/music/singer-1.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          FxText.titleLarge("My Bed on My Mind ".toUpperCase(),
                              fontWeight: 600),
                          FxText.bodySmall("Paul McCartney | Joaquin",
                              fontWeight: 400, letterSpacing: 0.3)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 220,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                      clipper: _Clipper(),
                      child: Container(
                        color: customTheme.card,
                      )),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          side: BorderSide.none),
                                      child: InkWell(
                                        splashColor: theme.colorScheme.primary,
                                        child: SizedBox(
                                            height: 48,
                                            width: 48,
                                            child: Icon(
                                              MdiIcons.skipPreviousOutline,
                                              color: theme
                                                  .colorScheme.onBackground,
                                              size: 28,
                                            )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                Hero(
                                  tag: 'music-fab',
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(48),
                                        boxShadow: [
                                          BoxShadow(
                                              color: theme.colorScheme.primary
                                                  .withAlpha(42),
                                              spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(0, 6))
                                        ]),
                                    child: ClipOval(
                                      child: Material(
                                        elevation: 5,
                                        color: theme.colorScheme.primary,
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          child: IconButton(
                                            iconSize: 28,
                                            icon: AnimatedIcon(
                                              icon: AnimatedIcons.play_pause,
                                              progress: _animationController,
                                              color:
                                                  theme.colorScheme.onPrimary,
                                            ),
                                            onPressed: () {
                                              if (isPlaying) {
                                                _animationController.reverse();
                                                _onPause();
                                                setState(() {
                                                  isPlaying = false;
                                                });
                                              } else {
                                                _animationController.forward();
                                                _onPlay();
                                                setState(() {
                                                  isPlaying = true;
                                                });
                                              }
                                            },
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          side: BorderSide.none),
                                      child: InkWell(
                                        splashColor: theme.colorScheme.primary,
                                        child: SizedBox(
                                            height: 48,
                                            width: 48,
                                            child: Icon(
                                              MdiIcons.skipNextOutline,
                                              color: theme
                                                  .colorScheme.onBackground,
                                              size: 28,
                                            )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 12),
                            child: Row(
                              children: <Widget>[
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        side: BorderSide.none),
                                    child: InkWell(
                                      splashColor: theme.colorScheme.primary,
                                      child: SizedBox(
                                          height: 36,
                                          width: 36,
                                          child: Icon(
                                            MdiIcons.shuffle,
                                            color:
                                                theme.colorScheme.onBackground,
                                            size: 22,
                                          )),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: FxText.bodySmall(_time,
                                        fontWeight: 500)),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderTheme.of(context)
                                        .copyWith(trackHeight: 2.5),
                                    child: Slider(
                                      value: _position.toDouble(),
                                      onChanged: _onTrackDurationChange,
                                      min: 0,
                                      max: _duration.toDouble(),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: FxText.bodySmall("3:20",
                                        fontWeight: 500)),
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        side: BorderSide.none),
                                    child: InkWell(
                                      splashColor: theme.colorScheme.primary,
                                      child: SizedBox(
                                          height: 36,
                                          width: 36,
                                          child: Icon(
                                            repeatType == 0
                                                ? MdiIcons.repeat
                                                : (repeatType == 1
                                                    ? MdiIcons.repeatOnce
                                                    : MdiIcons.repeatOff),
                                            color:
                                                theme.colorScheme.onBackground,
                                            size: 22,
                                          )),
                                      onTap: () {
                                        setState(() {
                                          repeatType = (++repeatType) % 3;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: ClipOval(
                      child: Material(
                        color: theme.colorScheme.secondary,
                        child: InkWell(
                          splashColor: Colors.white,
                          // inkwell color
                          child: SizedBox(
                              width: 48,
                              height: 48,
                              child: Icon(
                                MdiIcons.heartOutline,
                                color: theme.colorScheme.onSecondary,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: ClipOval(
                      child: Material(
                        color: theme.colorScheme.secondary,
                        child: InkWell(
                          splashColor: Colors.white,
                          // inkwell color
                          child: SizedBox(
                              width: 48,
                              height: 48,
                              child: Icon(
                                MdiIcons.shareOutline,
                                color: theme.colorScheme.onSecondary,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width / 2, -40, size.width, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
