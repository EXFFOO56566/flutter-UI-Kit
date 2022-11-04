/*
* File : Animated Icon
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class AnimatedIconScreen extends StatefulWidget {
  @override
  _AnimatedIconScreenState createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: FxSpacing.fromLTRB(16, 32, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FxText.titleSmall("Animated Icon", fontWeight: 600),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.play_pause,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.add_event,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.arrow_menu,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.ellipsis_search,
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.home_menu,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.view_list,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.menu_close,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.menu_arrow,
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.play_pause,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.add_event,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.arrow_menu,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.ellipsis_search,
                  isBackground: true,
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.home_menu,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.view_list,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.menu_close,
                  isBackground: true,
                ),
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.menu_arrow,
                  isBackground: true,
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(24),
            child: FxText.titleSmall("Slow Motion", fontWeight: 600),
          ),
          Container(
            margin: FxSpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                  animatedIconData: AnimatedIcons.play_pause,
                  isBackground: true,
                  isSlowMotion: true,
                ),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.add_event,
                    isBackground: true,
                    isSlowMotion: true),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.arrow_menu,
                    isBackground: true,
                    isSlowMotion: true),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.ellipsis_search,
                    isBackground: true,
                    isSlowMotion: true),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.home_menu,
                    isBackground: true,
                    isSlowMotion: true),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.view_list,
                    isBackground: true,
                    isSlowMotion: true),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.menu_close,
                    isBackground: true,
                    isSlowMotion: true),
                SingleAnimatedIcon(
                    animatedIconData: AnimatedIcons.menu_arrow,
                    isBackground: true,
                    isSlowMotion: true),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final bool isBackground, isSlowMotion;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      this.isBackground = false,
      this.isSlowMotion = false})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late AnimationController _animationController;
  bool isPlaying = false;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.isSlowMotion ? 1500 : 400));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Container(
      width: 44,
      height: 44,
      color: widget.isBackground
          ? theme.primaryColor.withAlpha(20)
          : Colors.transparent,
      child: ClipOval(
        child: IconButton(
          iconSize: 24,
          icon: AnimatedIcon(
            icon: widget.animatedIconData,
            progress: _animationController,
            color: theme.colorScheme.primary,
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
      ),
    );
  }
}
