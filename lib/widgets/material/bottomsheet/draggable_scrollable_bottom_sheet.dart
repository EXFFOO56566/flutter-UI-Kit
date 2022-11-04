/*
* File : Draggable Scrollable Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class DraggableScrollableBottomSheet extends StatefulWidget {
  @override
  _DraggableScrollableSheetState createState() =>
      _DraggableScrollableSheetState();
}

class _DraggableScrollableSheetState
    extends State<DraggableScrollableBottomSheet> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final List<String> _queueChoice = [
    "Move to Top",
    "Move to Bottom",
    "Remove",
    "Download"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DraggableScrollableSheet(
          initialChildSize: 0.13,
          minChildSize: 0.13,
          maxChildSize: 0.75,
          builder: (BuildContext context, controller) {
            return _bottomSheet(controller);
          },
        ),
      ),
    );
  }

  Widget _bottomSheet(ScrollController controller) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: controller,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            FxContainer.none(
              padding: FxSpacing.fromLTRB(16, 8, 16, 20),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: FxSpacing.bottom(8),
                    child: Center(
                        child: Container(
                      height: 4,
                      width: 40,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.onBackground.withAlpha(120),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                    )),
                  ),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image(
                            image: AssetImage(Images.profileBanner),
                            fit: BoxFit.cover,
                            height: 56,
                            width: 56,
                          )),
                      FxSpacing.width(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.titleMedium("Love me",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.15,
                                fontWeight: 600),
                            FxText.bodyLarge("From older",
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                letterSpacing: 0.10),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                              backgroundColor: theme.colorScheme.primary,
                              iconColor: theme.colorScheme.onPrimary,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      side: BorderSide.none),
                                  child: InkWell(
                                    splashColor: theme.colorScheme.primary,
                                    // inkwell color
                                    child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          Icons.skip_next_outlined,
                                          color: theme.colorScheme.onBackground,
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: theme.backgroundColor,
              padding: FxSpacing.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: FxSpacing.bottom(16),
                    child: FxText.titleSmall("Up Next",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.2,
                        fontWeight: 600),
                  ),
                  Container(
                    color: theme.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        _SingleQueueWidget(
                          image: Images.profile1,
                          name: 'Queue one',
                          singer: 'Singer - 1',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: Images.profile2,
                          name: 'Queue two',
                          singer: 'Singer - 2',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: Images.profile3,
                          name: 'Queue three',
                          singer: 'Singer - 3',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: Images.profile5,
                          name: 'Queue four',
                          singer: 'Singer - 4',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: Images.profile6,
                          name: 'Queue five',
                          singer: 'Singer - 5',
                          choice: _queueChoice,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleQueueWidget extends StatelessWidget {
  final String image, name, singer;

  final List<String> choice;

  const _SingleQueueWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.singer,
      required this.choice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: FxSpacing.y(2),
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
                FxText.bodyLarge(name,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0.15,
                    fontWeight: 600),
                FxText.titleSmall(singer,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0.10)
              ],
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: themeData.primaryColor.withAlpha(16),
                child: InkWell(
                  splashColor: themeData.colorScheme.primary.withAlpha(100),
                  highlightColor: themeData.primaryColor.withAlpha(16),
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.favorite_outline,
                        color: themeData.colorScheme.primary,
                        size: 22,
                      )),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return choice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: FxText.bodyMedium(choice,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0.2),
                  );
                }).toList();
              },
              icon: Icon(
                Icons.more_vert_sharp,
                color: themeData.colorScheme.onBackground,
              ),
              color: themeData.colorScheme.background,
            ),
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
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.primary.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
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
      ),
    );
  }
}
